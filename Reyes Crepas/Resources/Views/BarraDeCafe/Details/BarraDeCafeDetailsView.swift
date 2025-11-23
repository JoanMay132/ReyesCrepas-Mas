//
//  BarraDeCafeDetailView.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/24/25.
//

import SwiftUI

struct BarraDeCafeDetailsView: View {
    let barraDeCafe: MenuItem
    let extra: [MenuItem.Extra]
    @StateObject private var extrasManager = ExtrasSelectionManager<MenuItem.Extra>()
    @EnvironmentObject var cartManager: CartManager
    
    @State private var selectedExtras: [MenuItem.Extra : Int] =  [ : ]
    
    @State private var navigateToContentView = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productImageName: barraDeCafe.name ?? "default", productName: "Café \(barraDeCafe.name ?? "default")", productPrice: barraDeCafe.price, productDescription: nil)
                }
                // Calling method to show all the extras list in Barra de cafe Details View
                ExtrasListView(
                    title: "Elige tus extras",
                    extras: extra,
                    getName: {$0.name},
                    getPrice: {$0.price},
                    onSelect: {extra in
                        extrasManager.selectQuantity(for: extra)}
                )
                // Add to cart button and going to contentView
                AddToCartButtonView(
                    productName: "Café \(barraDeCafe.name ?? "default")",
                    productPrice: barraDeCafe.price ?? "default",
                    itemsQuantity: [], productSize: "",
                    extras:
                        extrasManager.selectedExtras.map { extra, quantity in
                        Extras(name: extra.name, price: extra.price, quantity: quantity)
                        },
                    cartManager: cartManager,
                    navigateToContentView: $navigateToContentView
                )
            }
            
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBackButtonView(title: "Barra de Café")
                }
            }
            .pinkCakeBackground()
            
        }
        .navigationDestination(isPresented: $navigateToContentView) {
            ContentView()
        }
        
        
        
    }
    
}
    
    
    
    #Preview {
        let barraDeCafe = MenuItem(id: "1", name: "Café de taro", price: "$20.92",
            extras: [MenuItem.Extra(id: 1, name: "vodka", price: "$30.99")],
                                   description: nil, personalización: nil,
                                   especialidades: nil)
        
        BarraDeCafeDetailsView(barraDeCafe: barraDeCafe, extra: barraDeCafe.extras ?? [] )
            .environmentObject(CartManager())
        
    }
                                      
                                    
                                      
