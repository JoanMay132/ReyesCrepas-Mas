//
//  BackgroundModifier.swift
//  Reyes Crepas
//
//  Created by Joan May on 29/01/25.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.pinkCakeBackground)
    }
}

extension View {
    func pinkCakeBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}
