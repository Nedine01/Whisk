//
//  UIApplication.swift
//  Whisk
//
//  Created by Nedine on 2/12/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
