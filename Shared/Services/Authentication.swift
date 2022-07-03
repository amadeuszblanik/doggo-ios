//
//  Authentication.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isAuthenticated = false
    
    func updateStatus(next: Bool) {
        withAnimation {
            isAuthenticated = next
        }
    }
}
