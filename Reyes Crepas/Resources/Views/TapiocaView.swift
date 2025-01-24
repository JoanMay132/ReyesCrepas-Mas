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
                VStack (alignment: .leading){
                    Text("Tapiocas base agua")

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
                                                .scaledToFit()
                                                .frame(width: 150, height: 130)
                                                .clipShape(.capsule)
                                                .overlay(
                                                    Capsule()
                                                        .strokeBorder(.white, lineWidth: 1)
                                                )
                                            VStack(alignment : .leading ) {
                                                Text(drink.name)
                                                    .foregroundStyle(.black)
                                                    .font(.headline)
                                            }
                                           
                                         
                                        }
                                        .padding(.horizontal)
                                    }
                                    .frame(width: 150)
                                    .background(Color.white.opacity(0.8))
                                }
                            }
                        }
                    }
                }
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
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundStyle(Color.gray)
                                        .padding(.vertical)
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
//            .navigationTitle("Tapiocas")
            .background(.pinkCakeBackground)
        }
    }
}

#Preview {
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    return TapiocaView(tapiocas: tapiocas)
}
