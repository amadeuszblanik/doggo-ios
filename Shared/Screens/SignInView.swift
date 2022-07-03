//
//  SignInView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var signInVM = SignInViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            Text("Doggo.Rocks")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("Sign in")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            
            Image("logo")
                .resizable()
                .scaleEffect()
                .frame(width: 150, height: 150)
            
            VStack {
                TextField("Email Address", text: $signInVM.username)
                .padding()
                .foregroundColor(Color(.label))
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
            
                SecureField("Password", text: $signInVM.password)
                    .padding()
                    .foregroundColor(Color(.label))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button("Sign in") {
                    signInVM.signIn { success in
                        print("Success")
                        
                        authentication.updateStatus(next: success)
                    }
                }
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color(.label))
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding()
            
            if (signInVM.inProgress) {
                ProgressView()
            }

            Spacer()
        }
        .disabled(signInVM.inProgress)
        .alert(item: $signInVM.error) { error in
            Alert(title: Text("Authentication failed"), message: Text(error.localizedDescription))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.dark)
    }
}
