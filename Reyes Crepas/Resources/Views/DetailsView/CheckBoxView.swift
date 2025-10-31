//
//  CheckBoxView.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/09/25.
//

import SwiftUI

struct CheckBoxView: View {
    let action: () -> Void
    @State private var isChecked = false   // Estado para controlar si está seleccionado
    
    var body: some View {
        Button(action: {
            isChecked.toggle()   // Cambia el estado
            action()             // Ejecuta la acción externa
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "checkmark.square")
                .font(.system(size: 20))
                .foregroundColor(isChecked ? .green : .black)  // Cambia de color si está seleccionado
        }
    }
}

#Preview {
    CheckBoxView(action: {})
}
