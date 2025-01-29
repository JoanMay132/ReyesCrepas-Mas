//
//  ProductStyylesModifier.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//
import SwiftUI

struct ProductStylesModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.yellowBackground)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.clear)
            )
    }
}

struct paddingProductListModifier : ViewModifier {
    func body(content : Content ) -> some View {
        content
            .padding([.horizontal, .bottom])

    }
}

extension View {
    func productStyleVStack() -> some View {
        self.modifier(ProductStylesModifier())
        
    }
    
    func paddingProductList () -> some View {
        self.modifier(paddingProductListModifier())
    }
    
}



