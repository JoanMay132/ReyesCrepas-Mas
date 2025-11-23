//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    @StateObject var productViewModel = ProductViewModel() // Carga tipos de productos
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            if productViewModel.products.isEmpty {
                // Loader mientras carga los tipos de productos
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .onAppear {
                        productViewModel.fetchProducts()
                    }
            } else {
                GridProductsLayout(
                    products: productViewModel.products,
                   
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
    }
}
