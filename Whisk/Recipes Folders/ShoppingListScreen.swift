//
//  ShoppingListScreen.swift
//  Whisk
//
//  Created by Nedine on 3/6/23.
//

import SwiftUI

struct ShoppingListScreen: View {
    @State var category = ""
    @State var enabled = false
    @State var ticked = false
    
    struct Category {
        let name: String
        let items: [String]
    }
    
    @State var categories = [Category(name: "Sushi", items: ["Cream Cheese", "Avocado", "Soy Sauce"]), Category(name: "Cookies", items: ["Vanilla", "Butter", "Eggs", "Baking Soda"])]
    
    var body: some View {
        NavigationView {
            VStack (spacing:10){
                
                //MARK: Create Category Field
                VStack {
                    HStack {
                        TextField("Create New Category", text: $category)
                            .onTapGesture {
                                enabled.toggle()
                            }
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("yellow"))
                            .opacity(category.isEmpty ? 0.0 : 1.0)
                    }
                    
                    Rectangle()
                        .frame(height: 1)
                        .padding(.top, 5)
                        .foregroundColor(enabled ? Color("yellow"): Color("lightgrey"))
                        
                }
                .padding(.vertical, 40)
                
                //MARK: Categories
                ScrollView {
                    ForEach(0..<categories.count,id: \.self) { num in
                        VStack(alignment: .leading) {

                            HStack {
                                Text(categories[num].name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Button {
                                    
                                } label: {
                                    Image("availability")
                                }
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image("plus")
                                }
                            }
                            .padding(.bottom, 15)
                            
                            ForEach(0..<categories[num].items.count,id: \.self) { index in
                                HStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 23, height: 23)
                                        .onTapGesture{
                                            ticked.toggle()
                                        }
                                        .overlay(
                                            Circle()
                                                .stroke(Color("yellow"), lineWidth: 2)
                                        )
                                    Text(categories[num].items[index])
                                        .padding(.leading, 5)
                                }
                                .padding(.leading, 1)
                                Divider()
                            }
                            
                        }
                        .padding(.bottom, 30)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
                enabled.toggle()
            }
            .padding(.horizontal, 27)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Shopping List")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("purple"))
                        .padding(.horizontal, 10)
                }
               
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                           
                    HStack {
                    
                            Menu {
                                Button("Select Folders", action: {})
                                Button("Cancel", role: .cancel, action: {})
                                    
            
                            } label: {
                                Image(systemName: "square.and.pencil.circle")
                                    .foregroundColor(Color("navy"))
                                   
                            }
                            .padding(.trailing, 10)
//                            .frame(width: 25, height: 25)
                        
//                            .background(.blue)
                        

                        
                            
        
                        }
               

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
