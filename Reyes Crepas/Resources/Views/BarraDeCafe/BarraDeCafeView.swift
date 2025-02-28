//
//  BarraDeCafe.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/27/25.
//

import SwiftUI


struct BarraDeCafeView: View {
    @StateObject private var barraDeCafeViewModel = BarraDeCafeViewModel()
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
                        ForEach(barraDeCafeViewModel.barraDeCafe) { barra in
                            NavigationLink {
                                BarraDeCafeDetailsView(barraDeCafe: barra, extra: barra.extras)
                            } label: {
                                VStack {
                                    Image(barra.name)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(barra.name)
                                            .font(.headline)
                                            .foregroundStyle(.black)
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
            .onAppear(){
                barraDeCafeViewModel.fetchProducts()
            }
            .pinkCakeBackground()
        
    }
}

#Preview {
    
    // Retorna la vista FrappeView con los frappes
     BarraDeCafeView()
}

