//
//  ContentView.swift
//  Shared
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var joke: String = "…"
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaleEffect()
                    .frame(width: 150, height: 150)
                
                VStack {
                    TextField("Email Address", text: $email)
                        .padding()
                        .foregroundColor(Color(.label))
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(Color(.label))
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    Button(action: {
                        signIn(username: email, password: password)
                    }, label: {
                        Text("Sign in")
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color(.label))
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    })
                    
                    Text(joke)
                }
                .padding()
                
                Spacer()
            }.navigationTitle("Sign in")
        }
        
        Text("Hello, world!")
            .padding()
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
