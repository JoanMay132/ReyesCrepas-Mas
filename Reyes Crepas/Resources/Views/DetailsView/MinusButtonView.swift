//
//  MinusButtonView.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/09/25.
//

import SwiftUI

struct MinusButtonView: View {
    let action: () -> Void

    var body: some View {
        

    
            Button(action: {
                action()
            }) {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 20, height: 20)

                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.gray.opacity(1.2))
                }
            }
        }
}

#Preview {
    MinusButtonView(action: {})
}
