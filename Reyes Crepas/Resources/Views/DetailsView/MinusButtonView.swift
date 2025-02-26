//
//  MinusButtonView.swift
//  Reyes Crepas
//
//  Created by Joan May on 25/02/25.
//

import SwiftUI

struct MinusButtonView: View {
    let action: () -> Void

    var body: some View {
        
        Button(action: {
            action()
        }) {
            Image(systemName: "minus.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    MinusButtonView(action : {})
}
