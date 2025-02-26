//
//  ReyesCrepas_MasApp.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

@main
struct ReyesCrepas_MasApp: App {
    @StateObject var cartManager = CartManager()

    init() {
        let appearance = UINavigationBarAppearance()
        
        // Configura el color del texto usando la extensión
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.darkBackground)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.darkBackground)]
        
        // Aplica la apariencia
        UINavigationBar.appearance().standardAppearance = appearance
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager) // Pasar CartManager como un environmentObject

        }
    }
}
