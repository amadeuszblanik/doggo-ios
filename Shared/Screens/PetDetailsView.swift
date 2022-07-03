//
//  PetDetailsView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import SwiftUI

struct PetDetailsView: View {
    var details: PetSingle
    
    var body: some View {
        VStack {
            Text("Name: \(details.name)")
            Text("Kind: \(details.kind)")
            Text("Breed: \(details.breed)")
            Text("Microchip: \(details.microchip)")
            Text("Birth date: \(details.birthDate)")
            Text("Is active: \(details.isActive.description)")
            Text("Created at: \(details.createdAt)")
            Text("Updated at: \(details.updatedAt)")
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(details: PetSingle(id: 0, name: "Goldie", kind: "DOG", breed: "Standard Schanuzer", microchip: "616093901225585", birthDate: "2022-12-01T23:00:00.000Z", isActive: true, createdAt: "2022-06-25T22:24:59.964", updatedAt: "2022-06-25T22:24:59.964"))
            .preferredColorScheme(.dark)
    }
}
