//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    let products: [Product] = Bundle.main.decode("products.json")
    let tapiocas : [Tapioca] = Bundle.main.decode("tapiocas.json")
    let pancakes: [Pancake] = Bundle.main.decode("pancakes.json")
    let crepas: [Crepas] = Bundle.main.decode("crepas.json")
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    let tallarines : [Tallarines] = Bundle.main.decode("tallarines.json")
    
    var body: some View {
        NavigationStack {
            GridProductsLayout(products: products, frappes: frappes, tapiocas: tapiocas, pancakes: pancakes, crepas: crepas, tallarines: tallarines, barraDeCafe: barraDeCafe)
        }
    }
}

#Preview {
    ContentView()
}
