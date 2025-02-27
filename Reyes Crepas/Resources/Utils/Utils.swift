//
//  Utils.swift
//  Reyes Crepas
//
//  Created by Joan May on 19/01/25.
//

import Foundation
import SwiftUI


func destinationProduct(for product : Product, frappes : [Frappe], tapiocas : [Tapioca], pancakes : [Pancake], crepas: [Crepas], barraDeCafe : [BarraDeCafe], tallarines : [Tallarines]) -> AnyView {

    switch ProductTypes(rawValue : product.productType.rawValue){
    case .frappe :
        return AnyView(FrappeView(frappes: frappes))
    case .tapiocas :
        return AnyView(TapiocaView(tapiocas : tapiocas))
    case .pancakes :
        return AnyView(PancakesView(pancakes : pancakes))
    case .crepas :
        return AnyView(CrepasView(crepas: crepas))
    case .barraDeCafe :
        return AnyView(BarraDeCafeView(barraDeCafe: barraDeCafe))
    case .tallarines :
        return AnyView(TallarinesView(tallarines : tallarines))
    case .none :
        return AnyView(Text("Product not found!"))
    }
}

