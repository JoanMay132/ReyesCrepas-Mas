//
//  TallarinesView.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//
import SwiftUI

struct TallarinesView: View {
    @StateObject private var tallarinesViewModel = TallarinesViewModel()
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
                        ForEach(tallarinesViewModel.tallarines) { tallarin in
                            NavigationLink(destination: TallarinesDetailsView(tallarines: tallarin)) {
                                VStack {
                                    Image(tallarin.imageName)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(tallarin.name)
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
                tallarinesViewModel.fetchProducts()
            }
            .pinkCakeBackground()
        }
    }
}

#Preview {
    TallarinesView()
}
