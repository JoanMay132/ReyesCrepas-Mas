//
//  CrepasView.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/25/25.
//

import SwiftUI


struct CrepasView: View {
    let crepas: [Crepas]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Crepas")
                            .productTitleStyleModifier()
                    }

                    LazyVGrid(columns: columns) {
                        ForEach(crepas) { crepa in
                            NavigationLink {
                                Text("Detalles de \(crepa.name)")
                            } label: {
                                VStack {
                                    Image(crepa.name)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(crepa.name)
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
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    
    // Retorna la vista FrappeView con los frappes
    return CrepasView(crepas: crepas)
}


    
    
    
    
    

