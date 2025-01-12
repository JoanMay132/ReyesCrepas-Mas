//
//  GridLayout.swift
//  Reyes Crepas
//
//  Created by Joan May on 12/01/25.
//

import SwiftUI

struct GridProductsLayout: View {
    let products : [Product]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    NavigationLink {
                        Text("Detail View")
                    } label : {
                        VStack {
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .padding()
                            
                            VStack {
                                Text(product.productType)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let products : [Product] = Bundle.main.decode("products.json")
    
    GridProductsLayout(products: products)
}
