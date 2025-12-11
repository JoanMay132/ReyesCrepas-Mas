//
//  ButtonModifier.swift
//  Reyes Crepas
//
//  Created by Joan May on 19/02/25.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content ) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

extension View {
    public func buttonStyleModifier () -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

struct ButtonPreview: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Hola")
            
        }
        .buttonStyleModifier( )
    }
}

#Preview {
    ButtonPreview()
}
