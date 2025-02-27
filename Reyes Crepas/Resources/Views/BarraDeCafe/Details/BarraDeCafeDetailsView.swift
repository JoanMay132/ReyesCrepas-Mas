//
//  BarraDeCafeDetailView.swift
//  Reyes Crepas
//
//  Created by David Chong on 2/24/25.
//

import SwiftUI

struct BarraDeCafeDetailsView: View {
    let barraDeCafe: BarraDeCafe
    let extra: [BarraDeCafe.Extra]
    @Environment(\.dismiss) private var dismiss
    @State private var selectedExtras: [BarraDeCafe.Extra : Int] =  [ : ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Image(barraDeCafe.name)
                            .resizable()
                            .frame(width: 350, height: 400)
                            .scaledToFit()
            
                    }
                    .shapeProduct()
            
                    VStack {
                        Text(barraDeCafe.name)
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
        
                        Text(barraDeCafe.price)
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
                                Text("Barra de Café")
                            }
                        }
                    }
                }
            }
        .pinkCakeBackground()

        }
    }
    
    private func increaseQuantity(for extra: BarraDeCafe.Extra) {
        let currentQuantity = selectedExtras[extra, default: 0]
        if currentQuantity < 3 {
            selectedExtras[extra] = currentQuantity + 1
        }
    }
    
    private func decreaseQuantity(for extra : BarraDeCafe.Extra ) {
        if let currentQuantity = selectedExtras[extra], currentQuantity > 0 {
            return selectedExtras [extra , default : 0] -= 1
            
        }
        
    }
}



#Preview {
    let barraDeCafe: [BarraDeCafe] = Bundle.main.decode("barra.json")
    if let barra = barraDeCafe.first(where: { $0.id == "americano" }) {
        return BarraDeCafeDetailsView(barraDeCafe: barra, extra: barra.extras)
    } else {
       return Text("Barra de Café not found")
    }
}
                                      
                                    
                                      
