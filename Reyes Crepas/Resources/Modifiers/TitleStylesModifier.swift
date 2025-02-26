//
//  Titles.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//

import SwiftUI

struct TitleStylesModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct TextProductName : ViewModifier {
    func body(content : Content ) -> some View {
        content
            .font(.title.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct TextProductModifier : ViewModifier {
    func body(content : Content ) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.black)
    }
}

struct TextStyleSizeModifier: ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(.body)
            .frame(width: 30)
    }
}

extension View {
    func productTitleStyleModifier() -> some View {
        self.modifier(TitleStylesModifier())
    }
    
    func productTextStyleModifier() -> some View {
        self.modifier(TextProductModifier())
    }
    
    func productNameTextStyleModifier () -> some View {
        self.modifier(TextProductName())
    }
    
    func textItemsStyleModifier() -> some View {
        self.modifier(TextStyleSizeModifier())
    }
}
