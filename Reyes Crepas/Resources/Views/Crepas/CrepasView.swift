//
//  CrepasView.swift
//  Reyes Crepas
//
//  Created by David Chong on 1/25/25.
//
import SwiftUI

struct CrepasView: View {
    @StateObject private var viewModel = MenuViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // Especialidades
                crepasEspecialidadesSection()
                
                // Sección para "Arma tu crepa"
                VStack(alignment: .leading) {
                    Text("Personaliza tu crepa")
                        .productTitleStyleModifier()
                        .padding(.horizontal)
                    
                    // LazyVGrid o solo un NavigationLink, según diseño
                    if let firstCrepa = viewModel.items.first {
                        NavigationLink {
                            CrepaDetailsView(crepa: firstCrepa)
                        } label: {
                            VStack {
                                Image("default")
                                    .productImageStyle()
                                
                                VStack {
                                    Text("Arma tu crepa")
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                }
                                .productStyleVStack()
                            }
                        }
                        .shapeProduct()
                        .padding(.horizontal)
                    } else {
                        // Placeholder si no hay crepas cargadas todavía
                        Text("Cargando crepas...")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                
            }
            .padding(.bottom, 40)
        }
        .pinkCakeBackground()
        .onAppear {
            viewModel.fetchProducts(from: "crepas")
        }
    }
}

private extension CrepasView {
    
    // MARK: - Especialidades
    func crepasEspecialidadesSection() -> some View {
        VStack(alignment: .leading) {
            Text("Especialidades")
                .productTitleStyleModifier()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.items.flatMap { $0.especialidades ?? [] }) { especialidad in
                        crepaCard(for: especialidad)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func crepaCard(for especialidad: MenuItem.Especialidad) -> some View {
        VStack {
            Image(especialidad.name)
                .productImageStyle()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(especialidad.name)
                    .font(.headline)
                    .foregroundStyle(.black)
            }
            .productStyleVStack()
        }
        .paddingProductList()
        .shapeProduct()
    }
}

#Preview {
    CrepasView()
}
