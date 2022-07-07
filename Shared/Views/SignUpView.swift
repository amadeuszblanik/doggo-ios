//
//  SignUpView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 07/07/2022.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var weightUnit: String = "KG"
    
    var weightUnits = [SelectItem(label: "Kilograms", id: "KG"), SelectItem(label: "Pounds", id: "lb"), SelectItem(label: "Grams", id: "G")]
    
    var body: some View {
        VStack {
            Text(String(
                localized: "sign_up",
                comment: "Sign up"
            ))
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            
            ScrollView {
                InputComponent(label: "E-mail", state: email, keyboardType: .emailAddress)
                    .padding(.bottom)
                
                InputComponent(label: "First name", state: firstName)
                    .padding(.bottom)
                
                InputComponent(label: "Last name", state: lastName)
                    .padding(.bottom)
                
                InputComponent(label: "Password", state: password)
                    .padding(.bottom)
                
                InputComponent(label: "Password confirmation", state: passwordConfirmation)
                    .padding(.bottom)

                SelectComponent(label: "Weight units", values: weightUnits, selected: weightUnit)
                    .padding(.bottom)
            }
                .padding(.vertical)
                .frame(alignment: .center)
            
            Spacer()
            
            ButtonComponent(
                text: String(
                    localized: "sign_up",
                    comment: "Sign up"
                ),
                fullWidth: true
            ) {
                print("Sign in")
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
    }
}
