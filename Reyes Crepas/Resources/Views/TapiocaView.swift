//
//  TapiocaView.swift
//  Reyes Crepas
//
//  Created by Joan May on 21/01/25.
//

import SwiftUI

struct TapiocaView: View {
    let tapiocas: [Tapioca]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    VStack(alignment: .leading) {
                      
                 
                        Text("Tapiocas base agua")
                            .productTitleStyleModifier()

                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            if let waterBasedTapiocas = tapiocas.first(where : {$0.id == "water_based"}) {
                                ForEach(waterBasedTapiocas.tapioca_drinks) { drink in
                                    NavigationLink {
                                        Text("Horizontales de \(drink.name)")
                                    } label: {
                                        VStack {
                                            Image(drink.name)
                                                .productImageStyle()
                                            
                                            VStack(alignment : .leading ) {
                                                Text(drink.name)
                                                    .font(.headline)
                                                    .foregroundStyle(.black)
                                            }
                                            .productStyleVStack()
                                        }
                                        .paddingProductList()
                                    }
                                    .shapeProduct()
                       
                                }
                            }

                        }
               

                        .padding(.horizontal)
                    }
                
                    VStack(alignment: .leading) {
                        Text("Tapiocas base leche")
                            .productTitleStyleModifier()

                    }
                    .padding(.horizontal)
                    
                    
                    VStack {
                        
        
                 
                        LazyVGrid(columns: columns) {
                            
                            ForEach(tapiocas) { tapioca in
                                ForEach(tapioca.tapioca_drinks) { drink in
                                    NavigationLink {
                                        VStack {
                                            Text("Detalles de \(drink.name)")
                                            ForEach(drink.size, id: \.type) { size in
                                                Text("\(size.type): \(size.price)")
                                            }
                                        }
                                    } label: {
                                        VStack {
                                            Image(drink.name)  //
                                                .productImageStyle()
                                            
                                            VStack {
                                                Text(drink.name)
                                                    .productTextStyleModifier()

                                            }
                                            .productStyleVStack()
                                        }
                                    }
                                    .shapeProduct()
                                }
                            }
                            .paddingProductList()
                        }
                    }
                }
            }
//            .navigationTitle("Tapiocas")
            .pinkCakeBackground()
        }
    }
}

#Preview {
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    return TapiocaView(tapiocas: tapiocas)
}
