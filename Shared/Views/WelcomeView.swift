//
//  SignUpView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 07/07/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State var isSignUpActive = false

    var body: some View {
        NavigationView{
            VStack {
                Spacer()

                Image("logo")
                    .resizable()
                    .scaleEffect()
                    .frame(width: 150, height: 150)
                    .padding()

                Text(String(
                    localized: "welcome_header",
                    comment: "Header on welcome screen"
                ))
                    .font(.headline)
                    .padding(.bottom, 2)
                
                Text(String(
                    localized: "welcome_subheader",
                    comment: "Subheader on welcome screen"
                ))
                    .font(.subheadline)
                    .padding(.bottom)
                
                Spacer()
                
                NavigationLink(destination: SignUpView(), isActive: $isSignUpActive) {
                    ButtonComponent(text: String(
                        localized: "sign_up",
                        comment: "Sign up"
                    ), fullWidth: true, outline: true) {
                        self.isSignUpActive = true
                    }
                }
                
                ButtonComponent(text: String(
                    localized: "sign_in",
                    comment: "Sign in"
                ), fullWidth: true) {
                    print("Pressed next")
                }
            }
            .padding()
        }
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
