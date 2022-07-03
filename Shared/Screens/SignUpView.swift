//
//  SignUpView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 04/07/2022.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var signUpVM = SignUpViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            VStack {
                TextField(String("First name"), text: $signUpVM.firstName)
                .padding()
                .foregroundColor(Color(.label))
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                
                TextField(String("Last name"), text: $signUpVM.lastName)
                .padding()
                .foregroundColor(Color(.label))
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

                TextField(String("E-mail"), text: $signUpVM.email)
                .padding()
                .foregroundColor(Color(.label))
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
                
                SecureField(String("Password"), text: $signUpVM.password)
                    .padding()
                    .foregroundColor(Color(.label))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField(String("Password confirmation"), text: $signUpVM.passwordConfirm)
                    .padding()
                    .foregroundColor(Color(.label))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button(String("Sign up")) {
                    signUpVM.signUp { message in
                        Alert(
                            title: Text("Success"),
                            message: Text(String("Yay!"))
                        )
                    }
                }
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color(.label))
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding()
            
            if (signUpVM.inProgress) {
                ProgressView()
            }

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .disabled(signUpVM.inProgress)
        .alert(item: $signUpVM.error) { error in
            Alert(title: Text(NSLocalizedString("general_error_message", comment: "")), message: Text(error.localizedDescription))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
