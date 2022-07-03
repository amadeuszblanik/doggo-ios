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
        NavigationView {
            List(myPetsVM.petsList) { pet in
                VStack {
                    NavigationLink(destination: PetDetailsView(details: pet)) {
                        Text(pet.name)
                    }
                }
            }
        }
    }
}

struct MyPetsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPetsView()
            .preferredColorScheme(.dark)
    }
}
