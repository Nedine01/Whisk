//
//  ShoppingListScreen.swift
//  Whisk
//
//  Created by Nedine on 3/6/23.
//

import SwiftUI

struct ShoppingListScreen: View {
//    @State var category = ""
//    @State var enabled = false
//    @State var addPressed = false
    @State var newItem = ""
//    @State private var presentAlert = false
//    @State var show = false
@StateObject var vm = ShoppingListViewModel()
//
//    @State var categories = [ShoppingListCategory(title: "Sushi", items: [Item(title: "Cream Cheese", isCompleted: false), Item(title: "Avocado", isCompleted: false), Item(title: "Soy Sauce", isCompleted: false)],orderID: 1)
//
//
//
//
//
//
//
//
//                             , ShoppingListCategory(title: "Cookies", items: [Item(title: "Vanilla", isCompleted: false), Item(title: "Butter", isCompleted: false), Item(title: "Eggs", isCompleted: false), Item(title: "Baking Soda", isCompleted: false)], orderID: 2)
//    ]
   
    
    
    var body: some View {
        NavigationView {
            ZStack {
            VStack (spacing:10){
                
                //MARK: Create Category Field
                VStack {
                    HStack {
                        TextField("Create New Category", text: $vm.category)
                            .onTapGesture {
                                vm.enabled = true
                            }
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("yellow"))
                            .opacity(vm.category.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                vm.categories.append(ShoppingListCategory(title: "h", items: [], orderID: 2))
                            }
                    }
                    
                    Rectangle()
                        .frame(height: 1)
                        .padding(.top, 5)
                        .foregroundColor(vm.enabled ? Color("yellow"): Color("lightgrey"))
                    
                }
                .padding(.horizontal, 27)
                .padding(.vertical, 40)
                
                //MARK: Categories
                GeometryReader{ g in
                    ScrollView {
                        ForEach(0..<vm.categories.count,id: \.self) { cat in
                            
                            
                           
                            test100(vm: vm, cat: vm.categories[cat], g: g,row: cat)
                            
//                            VStack(alignment: .leading) {
//
//                                HStack {
//                                    Text(cat.title)
//                                        .font(.title2)
//                                        .fontWeight(.bold)
//
//                                    Button {
//
//                                    } label: {
//                                        Image("availability")
//                                    }
//
//
//                                    Spacer()
//
//                                    Button {
//                                        addPressed = true
//                                    } label: {
//                                        Image("plus")
//                                    }
//                                }
//                                .padding(.bottom, 15)
//                                .padding(.horizontal, 27)
//
//
//                                List {
//
//                                    ForEach(cat.items, id:\.id) { item in
//
//                                        ListItemsView(item: item)
//                                            .listRowSeparator(.hidden)
//
//                                    }
//                                    .onDelete{ indexSet in
//                                        cat.items.remove(atOffsets: indexSet)
//                                    }
//
//                                    if addPressed {
//
//                                        HStack {
//                                            Circle()
//                                                .fill(.white)
//                                                .frame(width: 23, height: 23)
//                                                .overlay(
//                                                    Circle()
//                                                        .stroke(Color("yellow"), lineWidth: 2)
//                                                )
//                                            TextField("New Item", text: $newItem)
//                                                .padding(.leading, 5)
//
//                                            if !newItem.isEmpty {
//                                                Spacer()
//
//                                                Button {
//                                                    cat.items.append(Item(title: newItem, isCompleted: false))
//
//                                                    newItem = ""
//
//                                                    addPressed = false
//                                                } label: {
//                                                    Text("Done")
//                                                        .foregroundColor(Color("navy"))
//                                                }
//                                                .buttonStyle(PlainButtonStyle())
//                                                .padding(.trailing, 25)
//
//                                            }
//                                        }
//                                        .listRowSeparator(.hidden)
//                                    }
//
//
//                                }
//                                .frame(width:g.size.width,height: !addPressed ? 45 * CGFloat(cat.items.count) : 45 * CGFloat(cat.items.count + 1))
//                                //                            .background(.gray)
//                                .listStyle(PlainListStyle())
//                                .padding(.leading,10)
//                                //                            .padding(.trailing,30)
//                                .padding(.bottom,25)
//
//
//
//
//
//                            }
                            //                        .padding(.bottom, 30)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
                vm.enabled = false
            }
                
                if vm.show {
                    ZStack {
                        Color(.black)
                            .opacity(0.2)
                            .ignoresSafeArea()
                            .onTapGesture{ vm.show = false }
                        DeleteListsView(categories: $vm.categories, show: $vm.show)
                            .animation(.easeInOut, value: 5)
                            
                        
                    }
                    .animation(.easeInOut, value: 5)
                }
                    
            
        }
//            .padding(.horizontal, 27)
//            .background(.blue)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Shopping List")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("purple"))
                        .padding(.horizontal, 10)
                }
               
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                           
                    
                    
                            Menu {
                                Button("Delete Lists", action: {
                                    vm.presentAlert = true
                                    vm.show = true
                                })
                                
                                
                                Button("Cancel", role: .cancel, action: {})
                                    
            
                            } label: {
                                Image(systemName: "square.and.pencil.circle")
                                    .foregroundColor(Color("navy"))
                                   
                            }
                            .padding(.trailing, 10)
//                            .alert("Delete Lists",isPresented:
//                                    $presentAlert, actions: {
////                                TextField("BEEP", text: $newItem)
//
//
////                                        ForEach(categories, id: \.id) { cat in
////                                            Text(cat.title)
////                                        }
//
//
//                                Button("Cancel", role: .cancel ,action: {
//                                    presentAlert = false
//                                })
//                            })
//                            .frame(width: 25, height: 25)
                        
//                            .background(.blue)
                        

                        
                            
        
                        
               

                }
                
            }
         
     
            
        }
        
    }
    
}

struct ShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListScreen()
    }
}




@ViewBuilder
func test100(vm:ShoppingListViewModel,cat:ShoppingListCategory,g:GeometryProxy,row:Int) -> some View {
    
    VStack(alignment: .leading) {
        
        HStack {
            Text(cat.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Button {
                
            } label: {
                Image("availability")
            }
            
            
            Spacer()
            
            Button {
                vm.addPressed = true
            } label: {
                Image("plus")
            }
        }
        .padding(.bottom, 15)
        .padding(.horizontal, 27)
        
        
        List {
            
            ForEach(cat.items, id:\.id) { item in
                
                ListItemsView(item: item)
                    .listRowSeparator(.hidden)
                
            }
            .onDelete{ indexSet in
                cat.items.remove(atOffsets: indexSet)
            }
            
//            if vm.addPressed && row+1 == vm.selectedCategory.orderID{
//                
//                HStack {
//                    Circle()
//                        .fill(.white)
//                        .frame(width: 23, height: 23)
//                        .overlay(
//                            Circle()
//                                .stroke(Color("yellow"), lineWidth: 2)
//                        )
//                    TextField("New Item", text: vm.)
//                        .padding(.leading, 5)
//                    
//                    if !vm.newItem.isEmpty {
//                        Spacer()
//                        
//                        Button {
//                            cat.items.append(Item(title: vm.newItem, isCompleted: false))
//                            
//                            vm.newItem = ""
//                            
//                            vm.addPressed = false
//                        } label: {
//                            Text("Done")
//                                .foregroundColor(Color("navy"))
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.trailing, 25)
//                        
//                    }
//                }
//                .listRowSeparator(.hidden)
//            }
            
            
        }
        .frame(width:g.size.width,height: !vm.addPressed ? 45 * CGFloat(cat.items.count) : 45 * CGFloat(cat.items.count + 1))
        //                            .background(.gray)
        .listStyle(PlainListStyle())
        .padding(.leading,10)
        //                            .padding(.trailing,30)
        .padding(.bottom,25)
        
        
        
        
        
    }
}
