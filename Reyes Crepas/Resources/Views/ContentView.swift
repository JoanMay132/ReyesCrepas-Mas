//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    let products: [Product] = Bundle.main.decode("products.json")
    let tapiocas : [Tapioca] = Bundle.main.decode("tapiocas.json")
    let columns = [ GridItem(.adaptive(minimum : 150)) ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        NavigationLink {
                            destinationProduct(for: product, frappes: frappes, tapiocas: tapiocas)
                        } label : {
                            VStack {
                                Image(product.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 130)
                                    .padding()
                                
                                VStack {
                                    Text(product.productType)
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
                            .clipShape(.rect(cornerRadius : 10)
                            )
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(.yellowBackground, lineWidth : 2)

                            )

                        }
                    }
                }
                .padding([.horizontal, .bottom])
           

            }
            .navigationTitle("Reyes Crepas y Más")
            .background(.pinkCakeBackground)
            
        }
    }
}

#Preview {
    ContentView()
}
