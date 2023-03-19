//
//  ShoppingListModel.swift
//  Whisk
//
//  Created by Nedine on 3/13/23.
//

import Foundation

class ShoppingListCategory {
    let title: String
    var items: [Item]
    let id = UUID()
    let orderID:Int
    
    init(title: String, items: [Item],orderID:Int) {
        self.title = title
        self.items = items
        self.orderID = orderID
    }

}

struct Item: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

