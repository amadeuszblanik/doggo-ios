//
//  SignInViewModel.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    func signIn() {
        
        let defaults = UserDefaults.standard

        Webservice().signIn(username: username, password: password) { result in
            switch result {
            case .success(let accessToken):
                print(accessToken)
                defaults.setValue(accessToken, forKey: "accesstoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
}
