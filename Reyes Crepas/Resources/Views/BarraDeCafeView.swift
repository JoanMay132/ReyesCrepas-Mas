//
//  BarraDeCafe.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/27/25.
//

import SwiftUI


struct BarraDeCafeView: View {
    let barraDeCafe: [BarraDeCafe]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                 
                        Text("Barra de Café")
                            .productTitleStyleModifier()
                    }

                    LazyVGrid(columns: columns) {
                        ForEach(barraDeCafe) { barra in
                            NavigationLink {
                                Text("Detalles de \(barra.name)")
                            } label: {
                                VStack {
                                    Image(barra.name)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(barra.name)
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
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    
    // Retorna la vista FrappeView con los frappes
    return BarraDeCafeView(barraDeCafe: barraDeCafe)
}

