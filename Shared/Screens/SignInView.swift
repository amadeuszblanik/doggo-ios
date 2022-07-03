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
            
            Text(NSLocalizedString("signin_header", comment: ""))
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            
            Image("logo")
                .resizable()
                .scaleEffect()
                .frame(width: 150, height: 150)
            
            VStack {
                TextField(NSLocalizedString("signin_email_placeholder", comment: ""), text: $signInVM.username)
                .padding()
                .foregroundColor(Color(.label))
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
            
                SecureField(NSLocalizedString("signin_password_placeholder", comment: ""), text: $signInVM.password)
                    .padding()
                    .foregroundColor(Color(.label))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button(NSLocalizedString("signin_button", comment: "")) {
                    signInVM.signIn { success in
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
            Alert(title: Text(NSLocalizedString("signin_failed_alert_title", comment: "")), message: Text(error.localizedDescription))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.dark)
    }
}
