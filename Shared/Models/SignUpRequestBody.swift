//
//  SignUpRequestBody.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 04/07/2022.
//

import Foundation

struct SignUpRequestBody: Codable {
    let email: String
    let firstName: String
    let lastName: String
    let password: String
    let passwordConfirm: String
}
