//
//  DogTileView.swift
//  Doggo (iOS)
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import SwiftUI

struct DogTileView: View {
    var details: PetSingle
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(details.name)
                .font(.title)
                .padding(.bottom, 5.0)
            Text(details.breed)
                .font(.headline)
                .padding(2.0)
            Text(details.birthDate)
                .font(.footnote)
                .padding(2.0)
        }
        .padding()
        .frame(height: 256)
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
        .background(LinearGradient(colors: [Color.purple, Color.accentColor], startPoint: UnitPoint.bottomLeading, endPoint: UnitPoint.topTrailing))
        .cornerRadius(6)
    }
}

struct DogTileView_Previews: PreviewProvider {
    static var previews: some View {
        DogTileView(details: ModelData().petDetails[0])
            .preferredColorScheme(.dark)
    }
}
