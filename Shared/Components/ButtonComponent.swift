//
//  ButtonComponent.swift
//  Doggo (iOS)
//
//  Created by Amadeusz Blanik on 07/07/2022.
//

import SwiftUI

struct ButtonComponent: View {
    var text = "Button text"
    var color: Color = Color.accentColor
    var fullWidth: Bool = false
    var outline: Bool = false
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(maxWidth: self.fullWidth ? .infinity : nil)
                .padding(.vertical, 16.0)
                .padding(.horizontal, 32.0)
                .background(outline ? .clear : color)
                .foregroundColor(Color(.label))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color, lineWidth: 1)
                )
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonComponent(text: "Lorem ipsum") {
                print("Clicked")
            }
            .preferredColorScheme(.dark)

            ButtonComponent(text: "Lorem ipsum", fullWidth: true) {
                print("Clicked")
            }
            .preferredColorScheme(.dark)
            
            ButtonComponent(text: "Lorem ipsum", outline: true) {
                print("Clicked")
            }
            .preferredColorScheme(.dark)
        }
    }
}
