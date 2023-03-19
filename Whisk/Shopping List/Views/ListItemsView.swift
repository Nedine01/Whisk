//
//  ListItemsView.swift
//  Whisk
//
//  Created by Nedine on 3/13/23.
//

import SwiftUI

struct ListItemsView: View {
    @State var item: Item
//    var index: Int
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                ZStack{
                    Circle()
                        .fill(item.isCompleted ? Color("yellow") : .white)
                        .frame(width: 23, height: 23)
//                        .onTapGesture{
//                            item.isCompleted.toggle()
//                        }
                        .overlay(
                            Circle()
                                .stroke(Color("yellow"), lineWidth: 2)
                        )
                    if item.isCompleted {
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size:13))
                          
                            
                        
                    }
                }
//                .background(.blue)
                .onTapGesture{
                    item.isCompleted.toggle()
                }
                Text(item.title)
                    .padding(.leading, 5)
                    
                }
            Divider()
                .padding(.trailing,15)
             
            }
           
            
        
        }
//            .padding(.leading, 1)
//            .frame(height:30)
//            .background(.blue)
        
//        Divider()
        
    }


struct ListItemsView_Previews: PreviewProvider {
    static var item1 = Item(title: "Avocado", isCompleted: false)
    static var previews: some View {
        ListItemsView(item: item1)
    }
}
