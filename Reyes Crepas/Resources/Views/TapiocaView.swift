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
                            .font(.title.bold())
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 130)
                                                .padding()
                                            
                                            VStack(alignment : .leading ) {
                                                Text(drink.name)
                                                    .font(.headline)
                                                    .foregroundStyle(.black)
                                            }
                                            .padding(.vertical)
                                            .frame(maxWidth: .infinity)
                                            .background(.yellowBackground)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.clear)
                                            )
                                        }
                                        .padding(.horizontal)
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.yellowBackground)
                                    )
                       
                                }
                            }

                        }
               

                        .padding(.horizontal)
                    }
                
                    VStack(alignment: .leading) {
                        Text("Tapiocas base leche")
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 130)
                                                .padding()
                                            
                                            VStack {
                                                Text(drink.name)
                                                    .font(.headline)
                                                    .foregroundStyle(.black)
                                            }
                                            .padding(.vertical)
                                            .frame(maxWidth: .infinity)
                                            .background(.yellowBackground)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.clear)
                                            )
                                        }
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.yellowBackground)
                                    )
                                }
                            }
                            .padding([.horizontal, .bottom])
                        }
                    }
                }
            }
//            .navigationTitle("Tapiocas")
            .background(.pinkCakeBackground)
        }
    }
}

#Preview {
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    return TapiocaView(tapiocas: tapiocas)
}
