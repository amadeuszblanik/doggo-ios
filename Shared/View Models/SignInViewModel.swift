//
//  SignInViewModel.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var username: String = "joe.doe@doggo.rocks"
    @Published var password: String = "Passw0rd!1"
    @Published var inProgress: Bool = false

    func signIn(completion: @escaping (Bool) -> Void) {
        self.inProgress = true
        
        let defaults = UserDefaults.standard

        Webservice().signIn(username: username, password: password) { result in
            self.inProgress = false
            
            switch result {
            case .success(let accessToken):
                print(accessToken)
                defaults.setValue(accessToken, forKey: "accesstoken")
                completion(true)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
}
