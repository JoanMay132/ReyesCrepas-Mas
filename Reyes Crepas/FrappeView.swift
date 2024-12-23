//
//  FrappeView.swift
//  Reyes Crepas
//
//  Created by David Chong on 12/23/24.
//

import SwiftUI

struct FrappeView: View {
    let frappe: Frappes
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(frappe.id)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                
                Text(frappe.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Precio: \(frappe.price)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Extras:")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
                        
                        
                        
                        
                        // extras aquí
                        
                    }
                }
            }
        }


#Preview {
    let frappes: Frappes = Bundle.main.decode("frappes.json")

    FrappeView(frappe: frappes)
        
}
