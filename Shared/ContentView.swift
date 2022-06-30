//
//  ContentView.swift
//  Shared
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var signInVM = SignInViewModel()
    @StateObject private var myPetsVM = MyPetsViewModel()

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
            
                SecureField("Password", text: $signInVM.password)
                    .padding()
                    .foregroundColor(Color(.label))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button(action: {
                    signInVM.signIn()
                }, label: {
                    Text("Sign in")
                        .frame(width: 150, height: 50)
                        .foregroundColor(Color(.label))
                        .background(Color.accentColor)
                        .cornerRadius(8)
                })

                Text(signInVM.isAuthenticated ? "Authenticated" : "Unauthenticated")
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                myPetsVM.getMyPets()
            }, label: {
                Text("Get my pets")
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color(.label))
                    .background(Color.accentColor)
                    .cornerRadius(8)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct User: Codable {
    let username: String;
    let password: String;
}
