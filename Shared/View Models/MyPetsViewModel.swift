//
//  MyPetsViewModel.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import Foundation

class MyPetsViewModel: ObservableObject {
    @Published var petsList = [PetSingle]()

    
    init() {
        self.getPetsList()
    }
    
    func getPetsList() {
        let defaults = UserDefaults.standard

        print("getMyPets()")
        
        guard let accessToken = defaults.string(forKey: "accesstoken") else {
            print("FAILED_ACCESS_TOKEN)")

            return
        }
        
        Webservice().myPets(token: accessToken) { result in
            switch result {
                case .success(let myPets):
                    print("Success \(myPets)")
                    DispatchQueue.main.async {
                        self.petsList = myPets
                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
        }
    }
}
