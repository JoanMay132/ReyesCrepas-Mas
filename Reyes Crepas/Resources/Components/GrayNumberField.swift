//
//  GrayNumberField.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/10/25.
//

import SwiftUI

struct GrayNumberField: View {
    var placeholder: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .numberPad

    var body: some View {
        VStack(alignment: .leading, spacing: 2) { 
            TextField(placeholder, text: $text)
                .keyboardType(keyboard)
                
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )

            // Validación: si el número tiene menos de 10 dígitos
            if !text.isEmpty && text.count < 10 {
                HStack(spacing: 4) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                    Text("El número debe tener 10 dígitos")
                        .font(.caption)
                }
                .foregroundColor(.red)
                .padding(.leading, 4)
                .transition(.opacity)
            }
        }
        .onChange(of: text) {
            text = TextValidation.validatePhoneNumber(newValue: text)
        }
        
    }
    
}

struct FormField_Previews: PreviewProvider {
    @State static var phone = ""

    static var previews: some View {
        FormField(label: "Número de celular", placeholder: "Escribe tu número", text: $phone, isNumberField: true, keyboard: .numberPad)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
