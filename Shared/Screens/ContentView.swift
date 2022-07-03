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
            Text("You are authenticated")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
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
