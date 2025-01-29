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
                        ForEach(tallarines) { tallarine in
                            NavigationLink {
                                Text("Detalles de \(tallarine.name)")
                            } label: {
                                VStack {
                                    Image(tallarine.name)
                                        .productImageStyle()
                                    
                                    VStack {
                                        Text(tallarine.name)
                                            .productTextStyleModifier()

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
