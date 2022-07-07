//
//  SignUpView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 07/07/2022.
//

import SwiftUI

struct WelcomeView: View {
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
                
                Text(String(
                    localized: "welcome_subheader",
                    comment: "Subheader on welcome screen"
                ))
                    .font(.subheadline)
                    .padding()
                
                Spacer()
                
                ButtonComponent(text: String(
                    localized: "sign_up",
                    comment: "Subheader on welcome screen"
                ), fullWidth: true, outline: true) {
                    print("Pressed next")
                }
                
                ButtonComponent(text: String(
                    localized: "sign_in",
                    comment: "Subheader on welcome screen"
                ), fullWidth: true) {
                    print("Pressed next")
                }
            }
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
