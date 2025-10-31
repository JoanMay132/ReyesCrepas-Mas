//
//  FormField.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/10/25.
//

import SwiftUI

struct FormField :  View {
    var label: String
    var placeholder: String
    @Binding var text: String
    var isNumberField: Bool = false
    enum Field {
         case text
     }

    var keyboard: UIKeyboardType = .default

    var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Text(label)
                    .font(.headline)

                
                if isNumberField {
                    GrayNumberField(placeholder: placeholder, text: $text, keyboard: keyboard)

                    
                } else {
                    GrayTextField(placeholder: placeholder, text: $text, keyboard: keyboard)

                    
                }

            }
  
        }
}

#Preview {
    FormField(label: "Nombre(s)", placeholder: "Ingresa tu nombre", text: .constant(""))
}
