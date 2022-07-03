//
//  PetSingle.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import Foundation

struct PetSingle: Codable, Identifiable {
    let id: Int
    let name: String
    let kind: String
    let breed: String
    let microchip: String
    let birthDate: String
    let isActive: Bool
    let createdAt: String
    let updatedAt: String
}
