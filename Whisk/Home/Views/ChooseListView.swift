//
//  ChooseListView.swift
//  Whisk
//
//  Created by Nedine on 4/16/23.
//

import SwiftUI

struct ChooseListsView: View {
//    @Binding var categories: [ShoppingListCategory]
//    @Binding var show: Bool
//    @Binding var selectedCategory: Int
    @StateObject var vm: HomeScreenViewModel
    
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            Text("Choose List")
                .fontWeight(.bold)
                .foregroundColor(Color("navy"))
                .font(.title3)
                .padding(.top,10)
            
            Text("Select the list you would like to be shown")
                .font(.caption)
                .padding(.bottom,10)
                
            List {
                ForEach(0..<vm.categories.count, id:\.self) { num in
    
                    Text(vm.categories[num].title)
                            .onTapGesture {
                                    vm.showChooseList = false
                                    vm.selectedCategory = num
                                
                                print(vm.categories[vm.selectedCategory].title)

                                
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
//        .frame(width: 330, height:230)
//        .frame(width: 330, height:210)
//        .frame(width:321,height: 100)
        
    }
}
