//
//  Authentication.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import Foundation

class Authentication: ObservableObject {
    @Published var isAuthenticated = false
    
    func updateStatus(next: Bool) {
        if (!next) {
            let defaults = UserDefaults.standard

            defaults.removeObject(forKey: "accesstoken")
        }

        isAuthenticated = next
    }
}
