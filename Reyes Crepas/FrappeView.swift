//
//  FrappeView.swift
//  Reyes Crepas
//
//  Created by David Chong on 12/23/24.
//

import SwiftUI

struct FrappeView: View {
    let frappes: [Frappes]
    
    
    var body: some View {
        
        
        
        List(frappes) { frappe in
            VStack(alignment: .leading) {
                
                Image(frappe.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .padding(.trailing, 10)
                
                Text(frappe.id)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                
                
                Text("Precio: \(frappe.price)")
                    .font(.headline)
                
                ForEach(frappe.extras) { extra in
                    Text("\(extra.name) - \(extra.price)")
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle("Frappes")
    }
}

#Preview {
    // Decodifica el JSON de frappes
    let frappes: [Frappes] = Bundle.main.decode("frappes.json")
    
    // Retorna la vista FrappeDetailView con el primer frappe
    return FrappeView(frappes: frappes)
        
}
