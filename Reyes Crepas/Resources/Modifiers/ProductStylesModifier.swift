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
            .frame(width: 130)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.yellowBackground)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.clear)
            )
    }
}
struct ProductDetailsStyleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
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
    func productDetailsStyleVStack() -> some View {
        self.modifier(ProductDetailsStyleModifier())
    }
    
}



