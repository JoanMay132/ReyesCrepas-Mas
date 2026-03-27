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
            .frame( height: 174)
            .clipped()
            .cornerRadius(12)
    }
}

struct ProductImagesDefault: ViewModifier {
    let imageName : String

    func body(content: Content) -> some View {
        content
        
            .scaledToFill()
            .frame(height: 150)
            .overlay(
                Text("❌ \(imageName)")
                    .font(.caption)
                    .foregroundColor(.red)
            )
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

struct ProductImagesDetailsViewStyle : ViewModifier {
    func body(content: Content ) -> some View {
        content
            .frame(width: 350, height: 400)
            .scaledToFit()
    }
}

extension Image {
    func productImageStyle() -> some View {
        self.resizable().modifier(ProductImagesModifier())
        
    }
    func productImageDefaultStyle(_ name: String) -> some View {
        self.resizable().modifier(ProductImagesDefault(imageName: name))
        
    }
    func productImageDetailsViewStyle() -> some View {
        self.resizable().modifier(ProductImagesDetailsViewStyle())
    }
}

extension View {
    func shapeProduct() -> some View{
        self.modifier(ShapeProductModifier())
     }
}
