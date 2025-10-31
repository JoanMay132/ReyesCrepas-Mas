//
//  GrayTextField.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/10/25.
//

import Foundation
import SwiftUI

struct GrayTextField : View {
    var placeholder : String
    @Binding var text : String
    var keyboard: UIKeyboardType = .default

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(keyboard)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .onChange(of: text) {
                text = TextValidation.validateCharacters(newValue: text, oldValue: text)
                 }

    }
}

#Preview {
    GrayTextField(placeholder: "Nombre", text: .constant(""))
}
