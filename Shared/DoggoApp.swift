//
//  DoggoApp.swift
//  Shared
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import SwiftUI

@main
struct DoggoApp: App {
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isAuthenticated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                NewUserView()
                    .environmentObject(authentication)
            }
        }
    }
}
