//
//  ExtrasListView.swift
//  Reyes Crepas
//
//  Created by Joan May on 31/10/25.
//

import SwiftUI

struct ExtrasListView<ExtraType: Identifiable>: View {
    let title: String
    let extras: [ExtraType]
    let getName: (ExtraType) -> String
    let getPrice: (ExtraType) -> String
    let onSelect: (ExtraType) -> Void
    

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Divider()

            VStack(alignment: .leading) {
                ForEach(extras) { extra in
                    HStack(spacing: 10) {
                        Text(getName(extra))
                            .frame(width: 150, alignment: .leading)

                        Spacer()

                        Text(getPrice(extra))
                            .frame(width: 70, alignment: .trailing)

                        Spacer()

                        CheckBoxView(action: {
                            onSelect(extra)
                        })
                    }
                    Divider()
                        .padding(.vertical, 5)
                }
            }
        }
        .padding(20)
    }
}
