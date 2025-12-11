//
//  UserInformationView.swift
//  Reyes Crepas
//
//  Created by Joan May on 01/10/25.
//

import SwiftUI
import MapKit

struct UserInformationView: View {
    @State private var userName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var showMap = false
    @State private var showAlert = false
    @FocusState private var focusedField: Field?
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject private var whatsappVM: WhatsappViewModel
    
    enum Field {
        case userName, lastName, phoneNumber
    }
    
    var body: some View {
        ZStack {
            // 🔹 Fondo rosa global
            Color.pinkCakeBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                
                    VStack {
                        userInformation
                    }
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)

     
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    .ignoresSafeArea(edges: .top)
                  
                    // 🔹 Botón inferior
                    Button(action: {
                        if isFormValid {
                            if let _ = whatsappVM.messages.first {
                                let orderText = orderSummary
                                let totalText = "\(cartManager.calculateTotal())"
                                whatsappVM.sendOrder(order: orderText, total: totalText)
                            } else {
                                showAlert = true
                                print("Número de WhatsApp aún no disponible")
                            }
                        } else {
                            showAlert = true
                        }
                    }) {
                        Text("Place your order")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid && !whatsappVM.messages.isEmpty ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                    }
                    .alert("Completa todos los campos antes de continuar", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }
        }
        .onAppear {
            whatsappVM.getWhatsapp()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showMap = true
            }
        }
    }

    // MARK: - Formulario
    private var userInformation : some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hora de pedido: ")
                .bold()
            + Text(DateUtils.formatted(Date()))
            
            FormField(label: "Nombres(s)", placeholder: "Escribe tu nombre", text: $userName)
                .focused($focusedField, equals: .userName)

            FormField(label: "Apellido(s)", placeholder: "Escribe tu apellido", text: $lastName)
                .focused($focusedField, equals: .lastName)

            FormField(label: "Número de celular", placeholder: "Escribe tu número celular", text: $phoneNumber, isNumberField: true, keyboard: .numberPad)
                .focused($focusedField, equals: .phoneNumber)
            Spacer()

            if showMap {
                MapLocalView(showButton: false)
                    .frame(height: 300)
            } else {
                Color.gray.frame(height: 300)
            }

            Divider()
            Text("Total de tu pedido: \(cartManager.calculateTotal())")
                .font(.headline)
            Divider()
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Enter") { focusedField = nil }
            }
        }
    }

    // MARK: - Validación
    private var isFormValid: Bool {
        let trimmedPhone = phoneNumber.trimmingCharacters(in: .whitespaces)
        let onlyDigits = trimmedPhone.filter { $0.isNumber }
        
        return !userName.trimmingCharacters(in: .whitespaces).isEmpty &&
               !lastName.trimmingCharacters(in: .whitespaces).isEmpty &&
               onlyDigits.count == 10
    }

    // MARK: - Resumen de orden
    private var orderSummary: String {
        cartManager.items.map { item in
            var description = "\(item.quantity)x \(item.name) - $\(item.price)"
            
            if let extras = item.extras, !extras.isEmpty {
                let extrasText = extras.map { "\($0.quantity) x \($0.name)" }
                                       .joined(separator: ", ")
                description += " + Extras: [\(extrasText)]"
            }
            
            if !item.tapiocaType.isEmpty {
                description += " + Tapioca: \(item.tapiocaType)"
            }
            
            return description
        }
        .joined(separator: "\n")
    }
}

#Preview {
    NavigationStack {
        UserInformationView()
            .environmentObject(CartManager())
            .environmentObject(WhatsappViewModel())
    }
}
