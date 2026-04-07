//
//  SegmentedSelector.swift
//  Reyes Crepas
//
//  Created by Joan May on 07/04/26.
//
import SwiftUI
struct SegmentedSelector<T: Hashable>: View {
    
    let items: [T]
    let titleProvider: (T) -> String
    
    @Binding var selectedItem: T
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                Button {
                    selectedItem = item
                } label: {
                    Text(titleProvider(item))
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(selectedItem == item ? .white : .black)
                        .background(selectedItem == item ? Color.blue : Color.gray.opacity(0.15))
                }
                .buttonStyle(.plain)
            }
        }
        .clipShape(.rect(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4))
        )
        .padding()
    }
}
