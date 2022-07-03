//
//  RandomNumber.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 03/07/2022.
//

import Foundation

func randomIndex(maxValue: Int) -> Int {
    return Int(arc4random_uniform(UInt32(maxValue)))
}
