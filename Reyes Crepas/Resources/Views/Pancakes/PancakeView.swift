//
//  Pancakes.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/24/25.
//

import SwiftUI

struct PancakesView: View {
    let pancakes: [Pancake]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Pancakes")
                            .productTitleStyleModifier()

                    }

                    LazyVGrid(columns: columns) {
                        ForEach(pancakes) { pancake in
                            NavigationLink {
                                PancakesDetailsView(pancake: pancake)
                            } label: {
                                VStack {
                                    Image(pancake.name)
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
            .pinkCakeBackground()
        }
    }
}

#Preview {
    // Decodifica el JSON de frappes
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    
    // Retorna la vista FrappeView con los frappes
    return PancakesView(pancakes: pancakes)
}


    
    
    
    
    

