//
//  MyPetsViewModel.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 30/06/2022.
//

import Foundation

class MyPetsViewModel: ObservableObject {
//    @Published var myPets: [PetSingle] = []
    
    func getMyPets() {
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
//                    DispatchQueue.main.async {
//                        self.myPets = myPets
//                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
        }
    }
}
