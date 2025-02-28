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
        // Aquí debes usar el ViewModel de frappes, asegurándote de que ya está cargado
        return AnyView(FrappeView())
    case .tapiocas :
        return AnyView(TapiocaView())
    case .pancakes :
        return AnyView(PancakesView())
    case .crepas :
        return AnyView(CrepasView(crepas: crepas))
    case .barraDeCafe :
        return AnyView(BarraDeCafeView())
    case .tallarines :
        return AnyView(TallarinesView())
    case .none :
        return AnyView(Text("Product not found!"))
    }
}

