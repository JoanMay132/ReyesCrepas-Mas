//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var productViewModel = ProductViewModel() // productViewModel initializer
    @StateObject var frappeViewModel = FrappeViewModel() // frappeViewModel initializer
    @StateObject var tapiocaViewModel = TapiocaViewModel() // tapiocaViewModel initializer
    @StateObject var tallarinesViewModel = TallarinesViewModel() // tallarinesViewModel initializer
    @StateObject var pancakesViewModel = PancakeViewModel() // pancakesViewModel initializer
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    @StateObject var whatsappViewModel = WhatsappViewModel() 
    @StateObject var barraDeCafeViewModel = BarraDeCafeViewModel()
    @EnvironmentObject var cartManager: CartManager
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            // Loading products from firestore
            if productViewModel.products.isEmpty {
                ProgressView() // Loader
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                GridProductsLayout(
                    products: productViewModel.products, // Products loaded from firestore
                    frappes: frappeViewModel.frappes,
                    tapiocas: tapiocaViewModel.tapiocas,
                    pancakes: pancakesViewModel.pancakes,
                    crepas: crepas,
                    barraDeCafe: barraDeCafeViewModel.barraDeCafe,
                    tallarines: tallarinesViewModel.tallarines
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
            productViewModel.fetchProducts() // loading products from firestore
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
