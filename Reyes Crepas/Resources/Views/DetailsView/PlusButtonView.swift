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
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 20, height: 20)

                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.gray.opacity(1.2))
            }
        }
    
    }
}

#Preview {
    PlusButtonView(action: {})
}
