//
//  ProductImagesStyles.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//

import SwiftUI



struct ProductImagesModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 150, height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
    }
}



extension Image {
    func productImageStyle() -> some View {
        self.resizable().modifier(ProductImagesModifier())
    }
}

struct ShapeProductModifier : ViewModifier {
    func body(content: Content ) -> some View {
        content
            .clipShape(.rect(cornerRadius : 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.yellowBackground)
            )
    }
}

extension View {
    func shapeProduct() -> some View{
        self.modifier(ShapeProductModifier())
     }
}
