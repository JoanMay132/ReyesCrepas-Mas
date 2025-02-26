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
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    let tallarines : [Tallarines] = Bundle.main.decode("tallarines.json")
    @EnvironmentObject var cartManager: CartManager
    @AppStorage("showingGrid") private var showingGrid = true
    var body: some View {
        NavigationStack {
            GridProductsLayout(products: products, frappes: frappes, tapiocas: tapiocas, pancakes: pancakes, crepas: crepas, tallarines: tallarines, barraDeCafe: barraDeCafe)
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

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
