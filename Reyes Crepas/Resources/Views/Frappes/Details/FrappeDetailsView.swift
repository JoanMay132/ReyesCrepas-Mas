//
//  CoffeeDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 31/01/25.
//

import SwiftUI

struct FrappeDetailsView: View {
    let frappe: Frappe
    let extra: [Frappe.Extra]
    @EnvironmentObject var cartManager: CartManager

    @State private var selectedExtras: [Frappe.Extra: Int] = [:]
    @State private var navigateToContentView = false 
    private var selectedExtrasList: [Extras] {
        selectedExtras.compactMap { (extra, quantity) in
            quantity > 0 ? Extras(name: extra.name, price: extra.price, quantity: quantity) : nil
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProductDetailsView(productImageName: frappe.name,productName: "Frappé de \(frappe.name)", productPrice: frappe.price, productDescription: nil)
                  
                    // Calling method to show all the extras list in Frappe Details View
                    extrasList()
            
                    // Add to cart button and going to contentView
                    
                    AddToCartButtonView(
                        productName: "Frappé de \(frappe.name)",
                                       productPrice: frappe.price,
                                       itemsQuantity: [],
                                       extras: selectedExtrasList,

                                       cartManager: cartManager,
                                       navigateToContentView: $navigateToContentView
                    )
       
       
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationBackButtonView(title: "Frappes")
                    }
                }
            }
            .pinkCakeBackground()
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        }
    }
    
    // MARK - Product Image
    private func increaseQuantity(for extra: Frappe.Extra) {
        let currentQuantity = selectedExtras[extra, default: 0]
        if currentQuantity < 3 {
            selectedExtras[extra] = currentQuantity + 1
        }
    }
    
    private func decreaseQuantity(for extra: Frappe.Extra) {
        if let currentQuantity = selectedExtras[extra], currentQuantity > 0 {
            selectedExtras[extra] = currentQuantity - 1
        }
    }
}


// Function to show all the extras in frappes details view
private extension FrappeDetailsView {
    func extrasList() -> some View {
        VStack(alignment: .leading) {
            // Showing extras
            Text("Elige tus extras")
                .font(.headline)
            Divider()

            VStack(alignment: .leading) {
                ForEach(extra) { extra in
                    HStack(spacing: 10) {
                        Text(extra.name)
                            .frame(width: 150, alignment: .leading)

                        Spacer()

                        Text(extra.price)
                            .frame(width: 70, alignment: .trailing)

                        Spacer()

                     
                        // Plus Button to add more extras
                        PlusButtonView(action: {
                            increaseQuantity(for: extra)}
                        )
                        
                        Text("\(selectedExtras[extra] ?? 0)")
                            .textItemsStyleModifier()


                        MinusButtonView(action:   {                                    decreaseQuantity(for:extra)}
                        )
                    }
                    Divider()
                        .padding(.vertical, 5)
                }
            }
        }
        .padding()
    }
}
#Preview {
    let frappe = Frappe(id: "1", name: "Café Mocha", price: "$5.00", extras: [
        Frappe.Extra(id: 1, name: "Leche", price: "$0.50"),
        Frappe.Extra(id: 2, name: "Chocolate", price: "$1.00")
    ])
    let extra = frappe.extras
    
    return FrappeDetailsView(frappe: frappe, extra: extra)
        .environmentObject(CartManager())
}
