//
//  CartItem.swift
//  Reyes Crepas
//
//  Created by Joan May on 11/02/25.
//

import Foundation

struct ItemsQuantity: Identifiable, Equatable , Hashable{
    let id = UUID()
    let name: String
    let price: String
    var quantity: Int
}

struct Extras: Identifiable, Equatable , Hashable{
    let id = UUID()
    let name: String
    let price: String
    var quantity: Int
}

struct TapiocaDrink : Identifiable, Equatable {
    let id = UUID()
    let name : String
    let price : String

}


struct CartItem: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: String
    var quantity: Int
    var itemsQuantity: [ItemsQuantity]
    var extras : [Extras]?
    var tapiocaType : String
    var ProductSize : String

}
