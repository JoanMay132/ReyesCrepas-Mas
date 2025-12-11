//
//  PlusButtonView.swift
//  Reyes Crepas
//
//  Created by Joan May on 25/02/25.
//

import SwiftUI

struct PlusButtonView: View {
    let action: () -> Void

    var body: some View {
        Button(action: {
            action() 
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    PlusButtonView(action: {})
}
