//
//  HomeScreenViewModel.swift
//  Whisk
//
//  Created by Nedine on 4/16/23.
//

import Foundation
import SwiftUI
import SafariServices

class HomeScreenViewModel: ObservableObject {
    
    @Published var categories = [ShoppingListCategory(title: "Sushi", items: [Item(title: "Cream Cheese", isCompleted: false), Item(title: "Avocado", isCompleted: false), Item(title: "Soy Sauce", isCompleted: false)],orderID: 1)
                                
                                 , ShoppingListCategory(title: "Cookies", items: [Item(title: "Vanilla", isCompleted: false), Item(title: "Butter", isCompleted: false), Item(title: "Eggs", isCompleted: false), Item(title: "Baking Soda", isCompleted: false)], orderID: 2)]
    
    @Published var selectedCategory: Int = 0
    @Published var showChooseList = false
    
    @Published var showSafari = false
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
