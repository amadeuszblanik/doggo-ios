//
//  api.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import Foundation

struct SignInResponse {
    var access_token: String
}

struct Post:Codable{
    let username: String
    let password: String
    
}

func signIn(username: String, password: String) {
    guard let url =  URL(string:"https://doggo.rocks/api/auth/sign-in") else{ return }

    let body = "username=\(username)&password=\(password)"
    let finalBody = body.data(using: .utf8)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = finalBody
    
    URLSession.shared.dataTask(with: request){
        (data, response, error) in
        print(response as Any)
        if let error = error {
            print(error)
            return
        }
        guard let data = data else{
            return
        }
        print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
        
    }.resume()
}
