//
//  FolderRecipes.swift
//  Whisk
//
//  Created by Nedine on 2/8/23.
//

import SwiftUI

struct Recipe {
    let title: String
    let image: String
    let time: Int
    let serving: Int
}

struct RecipesScreen: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State var recipes = [Recipe(title: "Good Old-Fashioned Pancakes", image: "pancake1", time: 10, serving: 1) ,Recipe(title: "Everyday Pancakes", image: "pancake2", time: 10, serving: 1) ,Recipe(title: "Easy Pancakes", image: "pancake3", time: 10, serving: 1), Recipe(title: "The Best Fluffy Pancakes", image: "pancake4", time: 10, serving: 1)]
    
//    let images = ["pancake1","pancake2","pancake3","pancake4"]
//    let titles = ["Good Old-Fashioned Pancakes", "Everyday Pancakes", "Easy Pancakes","The Best Fluffy Pancakes"]
    
    @State var searchText = ""
    @State var enabled = false
    
    
    var body: some View {
            
            ScrollView {
               
                HStack (spacing: 10){
                  
                        HStack {
                            Image("magnify")
                                .padding(.leading,15)
                            
                            
                            TextField("Search", text: $searchText)
                                .foregroundColor(Color("navy"))
                                .disableAutocorrection(true)
                                .overlay(
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(Color("navy"))
                                        .padding()
                                        .opacity(searchText.isEmpty || !enabled  ? 0.0 : 1.0)
                                        .onTapGesture {
                                            searchText = ""
                                        }
                                    
                                    ,alignment: .trailing
                                
                                )
                                .onTapGesture {
                                    
                                    enabled = true
                                    
                                }
                            
                        }
                        .frame(height: 46)
                        .background(
                            RoundedRectangle(cornerRadius: 9)
                                .fill(Color("search"))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 9)
                                .stroke(Color("greysearch"))
                        )
                        .padding(.top,15)
                    
                    
                    if enabled {
        
                            Text("Cancel")
                                .frame(height: 46)
                                .padding(.top, 15)
                                .foregroundColor(Color("navy"))
                                .onTapGesture {
                                    UIApplication.shared.endEditing()
                                    enabled = false
                                    searchText = ""
                                }
                    }
                        
                    
                }
                .padding(.horizontal, 32)
                
                
                LazyVGrid (columns: columns, spacing: 27) {
                    ForEach(0..<recipes.count, id:\.self) { num in

                        NavigationLink {
                            RecipeDetailScreen()
                            
                        } label: {
                            RecipeView(recipe: recipes[num])

                        }
                        
                    }
                }
                .padding(.horizontal, 32)
                .padding(.top, 30)
            }

    }
}

struct FolderRecipes_Previews: PreviewProvider {
    static var previews: some View {
        RecipesScreen()
    }
}
