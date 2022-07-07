//
//  SelectComponent.swift
//  Doggo
//
//  Created by Amadeusz Blanik on 08/07/2022.
//

import SwiftUI

struct SelectItem: Hashable, Identifiable {
    var label: String
    var id: String
}

struct SelectComponent: View {
    var label: String = "Picker label"
    var values: [SelectItem]
    @State var selected: String = ""
    
    private let listRowPadding: Double = 5 // This is a guess
    private let listRowMinHeight: Double = 45 // This is a guess
    private var listRowHeight: Double {
        max(listRowMinHeight, 20 + 2 * listRowPadding)
    }
    
    var body: some View {
        HStack{
            Text(label)
            Spacer()
            Picker(label, selection: $selected) {
                ForEach(values) { value in
                    Text(value.label)
                        .tag(value.id)
                        .font(.body)
                }
            }
        }
        .pickerStyle(MenuPickerStyle())
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(Color(.label))
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

struct SelectComponent_Previews: PreviewProvider {
    static var previews: some View {
        let items: [SelectItem] = [SelectItem(label: "Kilograms", id: "KG"), SelectItem(label: "Pounds", id: "LB"), SelectItem(label: "Grams", id: "G")]

        Group {
            SelectComponent(label: "Weight units", values: items)
                .preferredColorScheme(.dark)
            SelectComponent(label: "Weight units", values: items)
                .preferredColorScheme(.light)
        }
    }
}
