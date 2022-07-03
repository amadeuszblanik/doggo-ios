//
//  DogListView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import SwiftUI

struct DogListView: View {
    var petsList: [PetSingle]
    
    var body: some View {
        ScrollView {
            ForEach(petsList) { pet in
                NavigationLink(destination: PetDetailsView(details: pet)) {
                    DogTileView(details: pet)
                }
                .foregroundColor(.primary)
                .padding(.horizontal)
            }
        }
    }
}

struct DogListView_Previews: PreviewProvider {
    static var petDetails = ModelData().petDetails
    
    static var previews: some View {
        DogListView(petsList: Array(petDetails.prefix(2)))
            .preferredColorScheme(.dark)
    }
}
