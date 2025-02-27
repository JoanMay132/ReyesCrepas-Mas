//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var productViewModel = ProductViewModel() // Inicializamos el ProductViewModel
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    let tapiocas: [Tapioca] = Bundle.main.decode("tapiocas.json")
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    let tallarines: [Tallarines] = Bundle.main.decode("tallarines.json")
    @EnvironmentObject var cartManager: CartManager
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            // Esperamos a que los productos se carguen desde Firestore
            if productViewModel.products.isEmpty {
                ProgressView() // Muestra un indicador de carga mientras se obtienen los productos
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                GridProductsLayout(
                    products: productViewModel.products, // Usamos los productos cargados desde Firestore
                    frappes: frappes,
                    tapiocas: tapiocas,
                    pancakes: pancakes,
                    crepas: crepas,
                    barraDeCafe: barraDeCafe,
                    tallarines: tallarines
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CartView()) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "cart")
                                if cartManager.totalItems > 0 {
                                    Text("\(cartManager.totalItems)")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            productViewModel.fetchProducts() // Cargamos los productos de Firestore cuando la vista aparece
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
