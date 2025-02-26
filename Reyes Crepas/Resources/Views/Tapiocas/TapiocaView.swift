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
            ScrollView {
                VStack{
                   // Method to show Water Tapiocas
                    waterTapiocasSection()
                    milkTapiocasSection()
                
         
                }
            }
            .pinkCakeBackground()
    }
}

private extension TapiocaView {
    func waterTapiocasSection() -> some View {
        VStack(alignment: .leading) {
            Text("Tapiocas base agua")
                .productTitleStyleModifier()
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let waterBasedTapiocas = tapiocas.first(where: { $0.id == "water_based" }) {
                        ForEach(waterBasedTapiocas.tapioca_drinks) { drink in
                            tapiocaCard(for: drink, in: waterBasedTapiocas)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    func milkTapiocasSection() -> some View {
        VStack(alignment: .leading) {
            Text("Tapiocas base leche")
                .productTitleStyleModifier()
                .padding(.horizontal)

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(tapiocas) { tapioca in
                    ForEach(tapioca.tapioca_drinks) { drink in
                        tapiocaCard(for: drink, in: tapioca)
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    
    func tapiocaCard(for drink: Tapioca.TapiocaDrinks, in tapioca: Tapioca) -> some View {
        NavigationLink {
            TapiocaDetailsView(tapioca: tapioca, tapiocaDrink: drink, tapiocaSize: drink.size)
        } label: {
            VStack {
                Image(drink.id)
                    .productImageStyle()

                VStack {
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

#Preview {
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    return TapiocaView(tapiocas: tapiocas)
}
