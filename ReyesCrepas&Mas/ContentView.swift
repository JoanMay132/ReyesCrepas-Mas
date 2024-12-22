//
//  ContentView.swift
//  ReyesCrepas&Mas
//
//  Created by Joan May on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    let frappes = Bundle.main.decode("frappes.json")
    var body: some View {
       
        Text(String(frappes.count))
    }
}

#Preview {
    ContentView()
}
