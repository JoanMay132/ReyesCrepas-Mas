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
    let itemsQuantity: [ItemsQuantity]  // Lista de extras seleccionados
    let productSize: String
    let extras : [Extras]
    let cartManager: CartManager
    @Binding var navigateToContentView: Bool

    var body: some View {
        Button(action: {
            // Lógica de agregar al carrito
            let quantity = itemsQuantity.first?.quantity ?? 1  // Aquí se toma la cantidad del primer extra
            
            // Aquí se pasa itemsQuantity en lugar de selectedQuantity
            cartManager.addItem(
                productName: productName,
                productPrice: productPrice,
                itemsQuantity: itemsQuantity,  // Pasa los extras seleccionados (ahora el parámetro correcto)
                extras : extras,
                productType: nil,  // Si es necesario, agregar un tipo de producto
                productSize: productSize,  // Si es necesario, agregar un tamaño de producto
                quantity: quantity
            )
            navigateToContentView = true
        }) {
            Text("Agregar al carrito")
                .buttonStyleModifier()  // Usa tu modificador de estilo
        }
    }
}
