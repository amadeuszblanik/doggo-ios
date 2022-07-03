//
//  api.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import Foundation

enum AuthenticationError: Error, LocalizedError, Identifiable {
    case invalidCredentials
    case custom(errorMessage: String)
    
    var id: String {
        self.localizedDescription
    }
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return NSLocalizedString("Please verify your email and password and try again", comment: "")
        case .custom:
            return NSLocalizedString("Something went wrong", comment: "")
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noResponsedata
    case decodingError
}

struct SignInResponse: Codable {
    let access_token: String?
}

struct SignInRequestBody: Codable {
    let username: String
    let password: String
}

class Webservice {
    func signIn(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {

        guard let url = URL(string: "http://localhost:3000/api/auth/sign-in") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = SignInRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "Missing response body")))
                return
            }
            
            guard let signInResponse = try? JSONDecoder().decode(SignInResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }

            guard let token = signInResponse.access_token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
        }.resume()
    }
    
    func myPets(token: String, completion: @escaping (Result<[PetSingle], NetworkError>) -> Void) {
        print("Webservice.myPets()")
        print("TOKEN \(token)")
        
        guard let url = URL(string: "http://localhost:3000/api/pets/my?unit=KG") else {
            completion(.failure(.invalidURL))
            return
        }
        
        print("URL \(url)")
                       
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("REQUEST_FAILED - noResponseData")
                completion(.failure(.noResponsedata))
                return
            }
            
            guard let myPetsResponse = try? JSONDecoder().decode([PetSingle].self, from: data) else {
                print("REQUEST_FAILED - decodingError")

                completion(.failure(.decodingError))
                return
            }
            
            print("SUCCESS \(myPetsResponse)")
            completion(.success(myPetsResponse))
        }.resume()
    }
}
