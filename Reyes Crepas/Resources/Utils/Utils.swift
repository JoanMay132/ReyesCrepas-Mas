//
//  Utils.swift
//  Reyes Crepas
//
//  Created by Joan May on 19/01/25.
//

import Foundation
import SwiftUI

func destinationProduct(for product : Product, frappes : [Frappe], tapiocas : [Tapioca]) -> AnyView {
    switch ProductTypes(rawValue : product.productType){
    case .frappe :
        return AnyView(FrappeView(frappes: frappes))
    case .tapiocas :
        return AnyView(TapiocaView(tapiocas : tapiocas))
    case .none :
        return AnyView(Text("Product not found!"))
    }
}



