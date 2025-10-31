//
//  BarraDeCafeDetailView.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/24/25.
//

import SwiftUI

struct BarraDeCafeDetailsView: View {
    let barraDeCafe: BarraDeCafe
    let extra: [BarraDeCafe.Extra]
    @StateObject private var extrasManager = ExtrasSelectionManager<BarraDeCafe.Extra>()
    @EnvironmentObject var cartManager: CartManager
    
    @State private var selectedExtras: [BarraDeCafe.Extra : Int] =  [ : ]
    
    @State private var navigateToContentView = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productImageName: barraDeCafe.name, productName: "Café \(barraDeCafe.name)", productPrice: barraDeCafe.price, productDescription: nil)
                }
                // Calling method to show all the extras list in Barra de cafe Details View
                ExtrasListView(
                    title: "Elige tus extras",
                    extras: barraDeCafe.extras, getName: {$0.name},
                    getPrice: {$0.price},
                    onSelect: {extra in
                        extrasManager.selectQuantity(for: extra)}
                )
                // Add to cart button and going to contentView
                AddToCartButtonView(
                    productName: "Café \(barraDeCafe.name)",
                    productPrice: barraDeCafe.price,
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
        let barraDeCafe = BarraDeCafe(id: "1", name: "Americano", price: "$55.00", extras: [BarraDeCafe.Extra(id: 1, name: "Crema", price: "$5.00")])
        let extra = barraDeCafe.extras
        return BarraDeCafeDetailsView(barraDeCafe: barraDeCafe, extra: extra)
            .environmentObject(CartManager())
        
        
    }
                                      
                                    
                                      
