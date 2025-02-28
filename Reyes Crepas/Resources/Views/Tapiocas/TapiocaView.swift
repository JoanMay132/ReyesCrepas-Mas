//
//  TapiocaView.swift
//  Reyes Crepas
//
//  Created by Joan May on 21/01/25.
//

import SwiftUI

struct TapiocaView: View {
    @StateObject private var viewModel = TapiocaViewModel()  // Usando el ViewModel para obtener datos
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                // Método para mostrar Tapiocas base agua
                waterTapiocasSection()
                
                // Método para mostrar Tapiocas base leche
                milkTapiocasSection()
            }
        }
        .pinkCakeBackground()
        .onAppear {
            viewModel.fetchProducts() // Llama a la función para cargar los datos
        }
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
                    ForEach(viewModel.tapiocas.filter { $0.id == "water_based" }) { waterBasedTapioca in
                        ForEach(waterBasedTapioca.tapioca_drinks) { drink in
                            tapiocaCard(for: drink, in: waterBasedTapioca)
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
                ForEach(viewModel.tapiocas) { tapioca in
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
    TapiocaView()
        .environmentObject(TapiocaViewModel()) // Asignar un ViewModel de prueba
}
