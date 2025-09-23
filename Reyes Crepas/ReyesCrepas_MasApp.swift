//
//  ReyesCrepas_MasApp.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

import Firebase

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
    
    // Conection to firebase project
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
            
//            NavigationStack {
//                AuthenticationView(showSignInView: .constant(false))
//                    .environmentObject(cartManager) // Pasar CartManager como un environmentObject
//            }
            
         

        }
    }
}

// Conection to fireabase project
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

