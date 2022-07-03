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
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaleEffect()
                    .frame(width: 80, height: 80)
                    .padding()

                Text("Doggo.Rocks!")
                    .font(.largeTitle)
                    .padding()

                List {
                    NavigationLink (destination: MyPetsView(), label: {
                        Text("My pets")
                    })
                }
                
                
                Spacer()
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
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
