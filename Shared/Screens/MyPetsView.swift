//
//  MyPetsView.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import SwiftUI

struct MyPetsView: View {
    @ObservedObject var myPetsVM = MyPetsViewModel()

    var body: some View {
        DogListView(petsList: myPetsVM.petsList)
    }
}

struct MyPetsView_Previews: PreviewProvider {
    static var petDetails = Array(ModelData().petDetails.prefix(4))
    
    static var previews: some View {
        MyPetsView()
            .preferredColorScheme(.dark)
    }
}
