//
//  CartManager.swift
//  Reyes Crepas
//
//  Created by Joan May on 11/02/25.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []

    
    
    // Get total of items
    var totalItems: Int {
        items.reduce(0) { sum, item in
            sum + item.quantity
        }
    }


    // Add item to basket function
    func addItem(
        productName: String,
        productPrice: String,
        itemsQuantity: [ItemsQuantity],
        extras: [Extras]? = nil,  // Optional
        productType: String? = nil,
        productSize: String? = nil,
        quantity: Int = 1
    ) {
        let unwrappedExtras = extras ?? []
        let unwrappedItemsQuantity = itemsQuantity.isEmpty ? [] : itemsQuantity

        // Busca si ya existe un producto con las mismas 'itemsQuantity' y 'extras'
        if let index = items.firstIndex(where: {
            $0.name == productName &&
            $0.itemsQuantity == unwrappedItemsQuantity &&  // Comparación directa
            $0.extras == unwrappedExtras  // Comparación directa
        }) {
            // Si existe, solo se incrementa la cantidad
            items[index].quantity += quantity
        } else {
            // If does not exist, add a new one
            let newItem = CartItem(
                name: productName,
                price: productPrice,
                quantity: quantity,
                itemsQuantity: unwrappedItemsQuantity,  // Se asignan las 'itemsQuantity'
                extras: unwrappedExtras,  // Usamos el valor no opcional de extras
                tapiocaType: productType ?? "",
                ProductSize: productSize ?? ""
            )
            items.append(newItem)
        }
    }    // Función para eliminar un item del carrito
    func removeItem(at index: Int) {
        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }
    }

    // function to calculate all the items and extras of your basket
    func calculateTotal() -> String {
        let total = items.reduce(0) { sum, item in
            let itemPrice = Double(item.price.replacingOccurrences(of: "$", with: "")) ?? 0
            let itemTotal = itemPrice * Double(item.quantity)

            // Get total amount of extras
            let extrasTotal = item.extras?.reduce(0) { extraSum, extra in
                let extraPrice = Double(extra.price.replacingOccurrences(of: "$", with: "")) ?? 0
                return extraSum + (extraPrice * Double(extra.quantity))
            } ?? 0
            return sum + itemTotal + extrasTotal
        }
        return String(format: "$%.2f", total)
    }
}
