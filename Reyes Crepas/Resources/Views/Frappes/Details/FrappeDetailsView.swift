//
//  CoffeeDetailsView.swift
//  Reyes Crepas
//
//  Created by Joan May on 31/01/25.
//

import SwiftUI

struct FrappeDetailsView: View {
    let frappe: Frappe
    let extra: [Frappe.Extra]
    @Environment(\.dismiss) private var dismiss
    @State private var selectedExtras: [Frappe.Extra : Int] =  [ : ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Image(frappe.name)
                            .resizable()
                            .frame(width: 350, height: 400)
                            .scaledToFit()
            
                    }
                    .shapeProduct()
            
                    VStack {
                        Text(frappe.name)
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
        
                        Text(frappe.price)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    .padding(.horizontal)
                    .productStyleVStack()
                    
                    VStack(alignment: .leading) {
                        
                        
                       

            
                        // Code to show extras
                        Text("Elige tus extras")
                            .font(.headline)
                        Divider()
            
                        VStack(alignment : .leading) {
                            ForEach(extra) { extra in
                                HStack(spacing: 10) {
                                    Text(extra.name)
                                        .frame(width: 150, alignment: .leading)
            
            
                                    Spacer()
            
                                    Text(extra.price)
                                        .frame(width: 70, alignment: .trailing)
            
                                    Spacer()
            
                                    Button(action: {
                                        increaseQuantity(for : extra)
                                        // Acción para agregar extra
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)
                                    }
            
                                    Text("\(selectedExtras[extra ] ?? 0)")
                                        .font(.body)
                                        .frame(width: 30)
            
                                    Button(action: {
                                        decreaseQuantity(for: extra)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)
                                    }
                                }
                                Divider()
            
                                    .padding(.vertical, 5)
            
                            }
                        }
                    }
            
                    .padding()
            
                    NavigationLink(destination: ContentView()) {
                        Text("Agregar al carrito")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.top,20)
            
                    .padding()
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Frappes")
                            }
                        }
                    }
                }
            }
        .pinkCakeBackground()

        }
    }
    
    private func increaseQuantity(for extra: Frappe.Extra) {
        let currentQuantity = selectedExtras[extra, default: 0]
        if currentQuantity < 3 {
            selectedExtras[extra] = currentQuantity + 1
        }
    }
    
    private func decreaseQuantity(for extra : Frappe.Extra ) {
        if let currentQuantity = selectedExtras[extra], currentQuantity > 0 {
            return selectedExtras [extra , default : 0] -= 1
            
        }
        
    }
}

#Preview {
    let frappes: [Frappe] = Bundle.main.decode("frappes.json")
    if let frappe = frappes.first(where: { $0.id == "coffee" }) {
        return FrappeDetailsView(frappe: frappe, extra: frappe.extras)
    } else {
        return Text("Frappe not found")
    }
}
