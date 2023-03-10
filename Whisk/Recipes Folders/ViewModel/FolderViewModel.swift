//
//  FolderViewModel.swift
//  Whisk
//
//  Created by Nedine on 3/9/23.
//

//import Foundation
import UIKit
import SwiftUI

//@Published private var folder: Folder
final class FolderViewModel: ObservableObject {
//    @Published private var folders = [Folder(name: "Lunch", index: 1), Folder(name: "Breakfast", index: 2), Folder(name: "Dinner", index: 3), Folder(name: "Sushi", index: 4)]
    
    @Published var folders = [Folder(name: "Lunch", index: 1), Folder(name: "Breakfast", index: 2), Folder(name: "Dinner", index: 3), Folder(name: "Sushi", index: 4)] 
    
    
    
    func removeFolder(folder:Folder) {
        print("index to remove is: \(folder.index)")
        folders.remove(at: folder.index-1)
       
print(folders)
    }
    
}
