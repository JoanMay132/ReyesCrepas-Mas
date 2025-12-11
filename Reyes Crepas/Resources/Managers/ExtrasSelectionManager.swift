//
//  ExtrasSelectionManager.swift
//  Reyes Crepas
//
//  Created by Joan May on 31/10/25.
//


import Foundation

final class ExtrasSelectionManager<ExtraType: Hashable> : ObservableObject {
    
    @Published var selectedExtras : [ExtraType : Int] = [:]
    
    func selectQuantity(for extra: ExtraType) {
        let currentQuantity = selectedExtras[extra, default: 0]
        if currentQuantity <= 1 {
            selectedExtras[extra] = currentQuantity + 1
            print("Extra agregado: \(extra), Cantidad: \(selectedExtras[extra ] ?? 0)")

        }
    }
    

    

}
