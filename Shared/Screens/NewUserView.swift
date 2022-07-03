//
//  NewUserView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 04/07/2022.
//

import SwiftUI

struct NewUserView: View {
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
                .padding()
                
            NavigationView {
                List() {
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up")
                    }
                    NavigationLink(destination: SignInView()) {
                        Text("Sign in")
                    }
                }
            }
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
