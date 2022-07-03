//
//  AuthenticationError.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
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
            return NSLocalizedString("authentication_error_invalid_credentials", comment: "")
        case .custom:
            return NSLocalizedString("general_error_message", comment: "")
        }
    }
}
