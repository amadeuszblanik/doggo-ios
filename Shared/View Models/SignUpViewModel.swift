//
//  SignUpViewModel.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 04/07/2022.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = "Joe"
    @Published var lastName: String = "Doe"
    @Published var email: String = "joe.doe@doggo.rocks"
    @Published var password: String = "Passw0rd!1"
    @Published var passwordConfirm: String = "Passw0rd!1"
    @Published var inProgress: Bool = false
    @Published var error: AuthenticationError?
    @Published var message: String?
    
    func signUp(completion: @escaping (Bool) -> Void) {
        self.inProgress = true

        Webservice().signUp(email: email, firstName: firstName, lastName: lastName, password: password, passwordConfirm: passwordConfirm) { message in
            self.inProgress = false
            
            switch message {
            case .success(let message):
                self.message = message
                print("Success \(message)")
                completion(true)
            case .failure(let error):
                self.error = error
                print("Error \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
