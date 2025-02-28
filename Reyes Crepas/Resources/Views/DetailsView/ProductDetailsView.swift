//
//  ProductItemDetails.swift
//  Reyes Crepas
//
//  Created by Joan May on 25/02/25.
//

import SwiftUI



struct ProductDetailsView: View {
    let productImageName: String
    let productName : String
    let productPrice : String?
    let productDescription: String?
    var body: some View {
        VStack {
            Image(productImageName)
                .productImageDetailsViewStyle()
        }
        .shapeProduct()
        
        //Product Info Details View
        VStack {
            Text(productName)
                .productNameTextStyleModifier()
            
            if let price = productPrice {
                Text(price)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
     
            if let description = productDescription {
                Text(description)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
      
        }
        .padding(.horizontal)
        .productStyleVStack()
    }
}


#Preview {
    ProductDetailsView(productImageName: "Coco", productName: "Coco", productPrice: "12.00", productDescription: "Lorem ipsum dolor sit amet")
}
