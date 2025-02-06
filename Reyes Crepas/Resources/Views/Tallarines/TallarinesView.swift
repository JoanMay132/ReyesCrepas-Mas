//
//  TallarinesView.swift
//  Reyes Crepas
//
//  Created by Joan May on 28/01/25.
//

import SwiftUI

struct TallarinesView: View {
    let tallarines : [Tallarines]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Tallarines")
                            .productTitleStyleModifier()

                    }

                    LazyVGrid(columns: columns) {
                        ForEach(tallarines) { tallarin in
                            NavigationLink {
                                TallarinesDetailsView(tallarines : tallarin)
                            } label: {
                                VStack {
                                    Image(tallarin.name)
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
                        .paddingProductList()
                        
                    }
                }
            }
            .pinkCakeBackground()
        }
    }

}

#Preview {
    let tallarines : [Tallarines] = Bundle.main.decode("tallarines.json")
    return TallarinesView(tallarines : tallarines)
}
