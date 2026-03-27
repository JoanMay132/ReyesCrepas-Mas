//
//  ProductItemDetails.swift
//  Reyes Crepas
//
//  Created by Joan May on 25/02/25.
//

import SwiftUI



struct ProductDetailsView: View {
    let imageName: String?
    let productName : String
    let productPrice : String?
    let productDescription: String?
    var body: some View {
        VStack {
            if let imageName = imageName {
                Image(imageName)
                    .productImageDetailsViewStyle()
            }
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
        .productDetailsStyleVStack()
    }
}


#Preview {
    ProductDetailsView(imageName: "Coco", productName: "Coco", productPrice: "12.00", productDescription: "Lorem ipsum dolor sit amet")
}

//
//  ProductItemDetails.swift
//  Reyes Crepas
//
//  Created by Joan May on 25/02/25.
//

//import SwiftUI
//
//
//
//struct ProductDetailsView: View {
//    let imageName: String?
//    let productName : String
//    let productPrice : String?
//    let productDescription: String?
//    var body: some View {
//        VStack {
//            if let imageName = imageName {
//                Image(imageName)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 250)
//                    .clipped()
//            } else {
//                Image("default")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 250)
//                    .clipped()
//            }
//        }
//        .shapeProduct()
//        
//        //Product Info Details View
//        VStack(alignment: .leading) {
//            Text(productName)
//                .productNameTextStyleModifier()
//            
//            if let price = productPrice {
//                Text(price)
//                    .font(.subheadline)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//            }
//     
//            if let description = productDescription {
//                Text(description)
//                    .font(.subheadline)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//      
//        }
//        .padding(.horizontal)
//        .productStyleVStack()
//    }
//}
//
//
//#Preview {
//    ProductDetailsView(
//        imageName: "capuccino",
//        productName: "Coco",
//        productPrice: "12.00",
//        productDescription: "Lorem ipsum dolor sit amet"
//    )
//}

