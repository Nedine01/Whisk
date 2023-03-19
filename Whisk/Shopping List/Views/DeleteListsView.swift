//
//  DeleteListsView.swift
//  Whisk
//
//  Created by Nedine on 3/18/23.
//

import SwiftUI

struct DeleteListsView: View {
    @Binding var categories: [ShoppingListCategory]
    @Binding var show: Bool
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            Text("Delete List")
                .fontWeight(.bold)
                .foregroundColor(Color("navy"))
                .font(.title3)
                .padding(.top,10)
            
            Text("Select the list you want to delete")
                .padding(.bottom,15)
                
            List {
                ForEach(0..<categories.count, id:\.self) { num in
    
                        Text(categories[num].title)
                            .onTapGesture {
                                withAnimation{
                                    show = false
                                    categories.remove(at: num)
                                }
                            }
                 
                }
                
            }
            .listStyle(.plain)

        }
        .foregroundColor(Color("navy"))
        .padding(.horizontal,20)
        .padding(.bottom,25)
        .padding(.top,15)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 1)
        .frame(width: 330, height:230)
        
    }
}

//struct DeleteListsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeleteListsView(categories: [Category(title: "Sushi", items: [Item(title: "Cream Cheese", isCompleted: false), Item(title: "Avocado", isCompleted: false), Item(title: "Soy Sauce", isCompleted: false)]), Category(title: "Cookies", items: [Item(title: "Vanilla", isCompleted: false), Item(title: "Butter", isCompleted: false), Item(title: "Eggs", isCompleted: false), Item(title: "Baking Soda", isCompleted: false)]),Category(title: "Sushi", items: [Item(title: "Cream Cheese", isCompleted: false), Item(title: "Avocado", isCompleted: false), Item(title: "Soy Sauce", isCompleted: false)]), Category(title: "Cookies", items: [Item(title: "Vanilla", isCompleted: false), Item(title: "Butter", isCompleted: false), Item(title: "Eggs", isCompleted: false), Item(title: "Baking Soda", isCompleted: false)])])
//    }
//}
