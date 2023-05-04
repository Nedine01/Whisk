//
//  ShoppingListViewModel.swift
//  Whisk
//
//  Created by Nedine on 3/19/23.
//

import Foundation
import SwiftUI


class ShoppingListViewModel:ObservableObject {
    
    init() {
        //self._newItem = Binding.constant("a")

    }
    @Published var selectedCategory = ShoppingListCategory(title: "Sushi", items: [Item(title: "Cream Cheese", isCompleted: false), Item(title: "Avocado", isCompleted: false)],orderID: 1)
    
   
    @Published var category = ""
    @Published var enabled = false
    @Published var addPressed = false
    //@State var newItem: String = ""
   // @Published var newItem = ""

    @Published var presentAlert = false
    @Published var show = false
    
    
    @Published var categories = [ShoppingListCategory(title: "Sushi", items: [Item(title: "Cream Cheese", isCompleted: false), Item(title: "Avocado", isCompleted: false), Item(title: "Soy Sauce", isCompleted: false)],orderID: 1)
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              , ShoppingListCategory(title: "Cookies", items: [Item(title: "Vanilla", isCompleted: false), Item(title: "Butter", isCompleted: false), Item(title: "Eggs", isCompleted: false), Item(title: "Baking Soda", isCompleted: false)], orderID: 2)
                     ]
    
}
