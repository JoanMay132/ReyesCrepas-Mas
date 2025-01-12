//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    let frappes : [Frappes] = Bundle.main.decode("frappes.json")
    let products : [Product] = Bundle.main.decode("products.json")
    
    var body: some View {

        NavigationStack {
            LinearGradient(stops: [.init(color: Color(red: 0.9686, green: 0.749, blue: 0.8471), location: 0.4)], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            }
            .navigationTitle("Reyes Crepas & Más")
        }
        
    
    
}

#Preview {
    ContentView()
}
