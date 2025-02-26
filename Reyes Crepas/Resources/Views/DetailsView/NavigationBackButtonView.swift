//
//  NavigationBackButtonView.swift
//  Reyes Crepas
//
//  Created by Joan May on 25/02/25.
//

import SwiftUI

struct NavigationBackButtonView: View {
    let title : String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: { dismiss() }) {
            HStack {
                Image(systemName: "chevron.backward")
                Text(title)
            }
        }
    }
}

#Preview {
    NavigationBackButtonView(title : "Back")
}
