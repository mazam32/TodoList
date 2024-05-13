//
//  ListRowView.swift
//  TodoList
//
//  Created by Muhammad Hamd Azam on 5/7/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green: .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, watchOS 10.0, *)
struct MyPreview: PreviewProvider {
    static var previews: some View {
        let item1 = ItemModel(title: "First item!", isCompleted: false)
        let item2 = ItemModel(title: "Second item!", isCompleted: true)
        
        return Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}

