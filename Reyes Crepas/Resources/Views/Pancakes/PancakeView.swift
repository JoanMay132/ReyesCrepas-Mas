//
//  Pancakes.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/24/25.
//

import SwiftUI

struct PancakesView: View {
    @StateObject private var viewModel = MenuViewModel()
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
                        ForEach(viewModel.items) { item in
                            NavigationLink {
                                PancakesDetailsView(pancake: item)
                            } label: {
                                VStack {
                                    Image(item.imageName)
                                        .productImageStyle()
                                     
                                    VStack {
                                        Text(item.name ?? "default")
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
                viewModel.fetchProducts(from: "pancakes")
            }
            .pinkCakeBackground()
    }
}

#Preview {
    
    // Retorna la vista Pancakes view
    PancakesView()
}


    
    
    
    
    

