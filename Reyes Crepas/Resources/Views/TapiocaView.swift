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
            .navigationTitle("Tapiocas")
            .background(.pinkCakeBackground)
        }
    }
}

#Preview {
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    return TapiocaView(tapiocas: tapiocas)
}
