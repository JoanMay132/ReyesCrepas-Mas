//
//  VstackStyleModifier.swift
//  Reyes Crepas
//
//  Created by JoanMay132 on 11/12/25.
//

import SwiftUI

struct VstackStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 2) 
            )
            .padding(8)
    }
}

extension View {
    public func vstackStyleModifier() -> some View {
        self.modifier(VstackStyleModifier())
    }
}

struct VstackStyleModifier_Previews: View {
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .vstackStyleModifier()
    }
    
}

#Preview {
    VstackStyleModifier_Previews()
}
