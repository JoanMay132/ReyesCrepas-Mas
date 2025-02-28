//
//  Pancakes.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/24/25.
//

import SwiftUI

struct PancakesView: View {
    @StateObject private var pancakeViewModel = PancakeViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Pancakes")
                            .productTitleStyleModifier()

                    }

                    LazyVGrid(columns: columns) {
                        ForEach(pancakeViewModel.pancakes) { pancake in
                            NavigationLink {
                                PancakesDetailsView(pancake: pancake)
                            } label: {
                                VStack {
                                    Image(pancake.imageName)
                                        .productImageStyle()
                                     
                                    VStack {
                                        Text(pancake.name)
                                            .productTextStyleModifier()
                                    }
                                    .productStyleVStack()
                                }
                            }
                            .shapeProduct()
                        }
                        .paddingProductList()
                    }
                }
            }
            //
            .onAppear {
                pancakeViewModel.fetchProducts()
            }
            .pinkCakeBackground()
    }
}

#Preview {
    
    // Retorna la vista FrappeView con los frappes
    PancakesView()
}


    
    
    
    
    

