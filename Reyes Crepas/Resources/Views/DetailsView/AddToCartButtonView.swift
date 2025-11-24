//
//  AddToCartButtonView.swift
//  Reyes Crepas
//
//  Created by Joan May on 24/02/25.
//
import SwiftUI
struct AddToCartButtonView: View {
    let productName: String
    let productPrice: String
    let itemsQuantity: [ItemsQuantity]
    let productSize: String
    let extras: [Extras]
    let cartManager: CartManager
    @Binding var navigateToContentView: Bool
    var isEnabled: Bool = true

    var body: some View {
        Button(action: {
            guard isEnabled else { return }

            let quantity = itemsQuantity.first?.quantity ?? 1

            cartManager.addItem(
                productName: productName,
                productPrice: productPrice,
                itemsQuantity: itemsQuantity,
                extras: extras,
                productType: nil,
                productSize: productSize,
                quantity: quantity
            )
            navigateToContentView = true
        }) {
            Text("Agregar al carrito")
                .padding()
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isEnabled ? Color.green : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .disabled(!isEnabled)
    }
}
