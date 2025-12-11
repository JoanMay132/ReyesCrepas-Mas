//
//  Utils.swift
//  Reyes Crepas
//
//  Created by Joan May on 19/01/25.
//

import Foundation
import SwiftUI
import UIKit

func destinationProduct(for product : Product, frappes : [MenuItem], tapiocas : [Tapioca], pancakes : [MenuItem], crepas: [MenuItem], barraDeCafe : [MenuItem], tallarines : [MenuItem]) -> AnyView {

    switch ProductTypes(rawValue : product.productType.rawValue){
    case .frappe :
        // Aquí debes usar el ViewModel de frappes, asegurándote de que ya está cargado
        return AnyView(FrappeView())
    case .tapiocas :
        return AnyView(TapiocaView())
    case .pancakes :
        return AnyView(PancakesView())
    case .crepas :
        return AnyView(CrepasView())
    case .barraDeCafe :
        return AnyView(BarraDeCafeView())
    case .tallarines :
        return AnyView(TallarinesView())
    case .none :
        return AnyView(Text("Product not found!"))
    }
}

struct TextValidation {
    static func validateCharacters(newValue: String, oldValue: String, maxLength : Int = 30) -> String {
        let filtered = newValue.filter { $0.isLetter || $0.isWhitespace }
        return String(filtered.prefix(maxLength))
    }
    
    static func validatePhoneNumber(newValue: String) -> String {
        let filtered = newValue.filter { $0.isNumber }
        return String(filtered.prefix(10))
    }
    
}


struct DateUtils {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_MX")
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    static func formatted(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}



final class Utilities {
    static let shared = Utilities()
    private init() {}
    
     
    @MainActor
     func topViewController(controller: UIViewController? = nil) -> UIViewController? {
         
         let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
            if let navigationController = controller as? UINavigationController {
                return topViewController(controller: navigationController.visibleViewController)
            }
            if let tabController = controller as? UITabBarController {
                if let selected = tabController.selectedViewController {
                    return topViewController(controller: selected)
                }
            }
            if let presented = controller?.presentedViewController {
                return topViewController(controller: presented)
            }
            return controller
        }

}
