//
//  TallarinesView.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//
import SwiftUI

struct TallarinesView: View {
    @StateObject private var viewModel = MenuViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Tallarines")
                        .productTitleStyleModifier()
                        .padding(.leading)
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.items) { item in
                            NavigationLink(destination: TallarinesDetailsView(tallarines: item)) {
                                VStack {
                                    Image(item.imageName)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(item.name ?? "default")
                                            .font(.headline)
                                            .foregroundStyle(.black)
                                    }
                                    .productStyleVStack()
                                }
                            }
                            .shapeProduct()
                        }
                    }
                    .paddingProductList()
                }
                .padding(.horizontal)
            }
            .onAppear {
                viewModel.fetchProducts(from: "tallarines")
            }
            .pinkCakeBackground()
        }
    }
}

#Preview {
    TallarinesView()
}
