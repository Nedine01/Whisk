//
//  ShoppingListCardView.swift
//  Whisk
//
//  Created by Nedine on 4/7/23.
//

import SwiftUI

struct ShoppingListCardView: View {
//    @State var show: Bool
//    @State private var selectedCategory: Int
    @StateObject var vm: HomeScreenViewModel



    
    let items = [ShoppingItemCardView(item: Item(title: "Onions", isCompleted: false)),ShoppingItemCardView(item: Item(title: "Olive Oil", isCompleted: false)),ShoppingItemCardView(item: Item(title: "Tomatoes", isCompleted: false)),ShoppingItemCardView(item: Item(title: "Flour", isCompleted: false))]
    
    let rows = [
            GridItem(.fixed(35)),
            GridItem(.fixed(35))
        ]
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 0){
            
            

            Button {
                withAnimation{
                    vm.showChooseList = true
                }
            } label: {
                Image("info")
                    .frame(width: 25)
                    .padding(.top,20)
//                    .padding(.trailing,2)

            }
          
        
            
            LazyHGrid(rows: rows, alignment: .center) {
                
                var chosenCategory = vm.categories[vm.selectedCategory]
                var numOfCatgeoryItems = chosenCategory.items.count
                var itemsShown = numOfCatgeoryItems < 4 ? numOfCatgeoryItems : 4


                ForEach(0..<4) { num in
                    if num < itemsShown {
                        ShoppingItemCardView(item: chosenCategory.items[num])
                            .padding(.trailing,17)
                    }
                }
                .onChange(of: vm.selectedCategory) { newValue in
                           chosenCategory = vm.categories[newValue]
                           numOfCatgeoryItems = chosenCategory.items.count
                           itemsShown = numOfCatgeoryItems < 4 ? numOfCatgeoryItems : 4
                    print(newValue)
                       }

            }
            .padding(.horizontal,32)
            .padding(.bottom,7)
            .padding(.trailing,20)
           
        }
        .frame(width:321,height: 100)
        .padding(.bottom,25)
        .background(.white)
        .cornerRadius(9)
        .shadow(color: .black.opacity(0.10),radius: 5)
        
    }
    
    
}

//struct ShoppingListCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingListCardView()
//    }
//}

//@ViewBuilder
//func ShoppingListCardView2(vm: HomeScreenViewModel) -> some View {
////    @StateObject var vm = HomeScreenViewModel()
//    @State  var chosenCategory: ShoppingListCategory
//
//    let items = [ShoppingItemCardView(item: Item(title: "Onions", isCompleted: false)),ShoppingItemCardView(item: Item(title: "Olive Oil", isCompleted: false)),ShoppingItemCardView(item: Item(title: "Tomatoes", isCompleted: false)),ShoppingItemCardView(item: Item(title: "Flour", isCompleted: false))]
//
//    let rows = [
//            GridItem(.fixed(35)),
//            GridItem(.fixed(35))
//        ]
//
//
//        VStack(alignment: .trailing, spacing: 0){
//
//
//
//            Button {
//                withAnimation{
//                    vm.showChooseList = true
//                }
//            } label: {
//                Image("info")
//                    .frame(width: 25)
//                    .padding(.top,20)
////                    .padding(.trailing,2)
//
//            }
//
//
//
//            LazyHGrid(rows: rows, alignment: .center) {
//
//                var numOfCatgeoryItems = chosenCategory.items.count
//                var itemsShown = numOfCatgeoryItems < 4 ? numOfCatgeoryItems : 4
//
//
//                ForEach(0..<4) { num in
//                    if num < itemsShown {
//                        ShoppingItemCardView(item: chosenCategory.items[num])
//                            .padding(.trailing,17)
//                    }
//                }
//                .onChange(of: vm.selectedCategory) { newValue in
//                           chosenCategory = vm.categories[newValue]
//                           numOfCatgeoryItems = chosenCategory.items.count
//                           itemsShown = numOfCatgeoryItems < 4 ? numOfCatgeoryItems : 4
//                       }
//
//            }
//            .padding(.horizontal,32)
//            .padding(.bottom,7)
//            .padding(.trailing,20)
//
//        }
//        .frame(width:321,height: 100)
//        .padding(.bottom,25)
//        .background(.white)
//        .cornerRadius(9)
//        .shadow(color: .black.opacity(0.10),radius: 5)
//
//
//
//}
