//
//  InputComponent.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 08/07/2022.
//

import SwiftUI

struct InputComponent: View {
    var label = "Input label"
    @State var state: String = ""
    var keyboardType: UIKeyboardType = UIKeyboardType.default
    
    var body: some View {
        TextField(label, text: $state)
            .padding()
            .foregroundColor(Color(.label))
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            .keyboardType(keyboardType)
    }
}

struct InputComponent_Previews: PreviewProvider {
    static var previews: some View {
        InputComponent()
            .preferredColorScheme(.dark)
    }
}
