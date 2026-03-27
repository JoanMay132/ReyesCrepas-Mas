//
//  BarraDeCafe.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/27/25.
//

import SwiftUI


struct BarraDeCafeView: View {

   
    @StateObject private var viewModel = MenuViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                 
                        Text("Barra de Café")
                            .productTitleStyleModifier()
                    }

                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.items) { item in
                            NavigationLink {
                               
                                    BarraDeCafeDetailsView(barraDeCafe: item, extra: item.extras ?? [])
                        
                            } label: {
                                VStack {
                                    
                                    if let imageName = item.imagePath {
                                        if UIImage(named: imageName) != nil {
                                            Image(imageName)
                                                .productImageStyle()
                                        } else {
                                            Image("default")
                                                .productImageDefaultStyle(imageName)
                                        }
                                    } else {
                                        ProgressView()
                                            .frame(height: 150)
                                    }
                                    VStack {
                                        Text(item.name ?? "default")
                                            .productTextStyleModifier()

                                    }
                                    .productStyleVStack()
                                }
                                .paddingProductList()
                            }
                            .shapeProduct()
                        }
                    }
                }
            }
            //
            .onAppear(){
                viewModel.fetchProducts(from: "barra_de_cafe")
            }
            .pinkCakeBackground()
        
    }
}

#Preview {
    
    // Retorna la vista FrappeView con los frappes
     BarraDeCafeView()
        .environmentObject(CartManager())
}

