//
//  HomeScreen.swift
//  Whisk
//
//  Created by Nedine on 4/7/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var vm = HomeScreenViewModel()
    @FocusState var isSearchFocused:Bool
    @State var searchText = ""
    @State var enabled = false
    @State var showSideMenu = false
    
    
    @State var recipes = [Recipe(title: "Good Old-Fashioned Pancakes", image: "pancake1", time: 10, serving: 1) ,Recipe(title: "Everyday Pancakes", image: "pancake2", time: 10, serving: 1) ,Recipe(title: "Easy Pancakes", image: "pancake3", time: 10, serving: 1), Recipe(title: "The Best Fluffy Pancakes", image: "pancake4", time: 10, serving: 1)]
    
    @State var fixedRecipes = [Recipe(title: "Hommade Pizza and Pizza Dough", image: "pizza", time: 10, serving: 1)]
    
    var body: some View {
        

        NavigationView {
            
            ZStack(alignment: .leading){
                
                ZStack(alignment: .bottomTrailing){
                    
                    ScrollView {
                        //MARK: search bar
                        HStack (spacing: 10){
                            
                            HStack {
                                Image("magnify")
                                    .padding(.leading,15)
                                
                                
                                TextField("Search", text: $searchText)
                                
                                    .focused($isSearchFocused)
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
                                        //UIApplication.shared.endEditing()
                                        isSearchFocused = false
                                        enabled = false
                                        searchText = ""
                                    }
                            }
                            
                            
                        }
                        .padding(.horizontal, 32)
                        .padding(.top, 25)
                        
                        VStack (alignment: .leading){
                            
                            //MARK: recently added section
                            Text("Recently Added")
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .foregroundColor(Color("navy"))
                            
                            
                            
                            ScrollView(.horizontal){
                                HStack (spacing: 12){
                                    ForEach(0..<recipes.count, id:\.self) { num in
                                        
                                        NavigationLink {
                                            RecipeDetailScreen()
                                            
                                        } label: {
                                            RecipeView(recipe: recipes[num])
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.top, 10)
                                
                            }
                            
                            ZStack {
                                VStack(alignment: .leading){
                                    //MARK: shopping list section
                                    Text("Shopping List")
                                        .font(.system(size:20))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("navy"))
                                        .padding(.top, 25)
                                    
                                    ShoppingListCardView(vm: vm)
                                        .padding(.top, 10)
                                    
                                }
                                
                                if vm.showChooseList {
                                    ChooseListsView(vm: vm)
                                    //                                .animation(.easeInOut(duration: 0.3), value: 0)
                                    //                                .transition(.move(edge: .bottom))
                                    //                                .animation(.easeInOut(duration: 0.3), value: 10)
                                        .transition(.scale)
                                }
                                
                            }
                            //MARK: editor's choice section
                            Text("Editor's Choice")
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .foregroundColor(Color("navy"))
                                .padding(.top, 25)
                            
                            VStack {
                                ForEach(fixedRecipes,id:\.title) { recipe in
                                    Editor_sChoiceCardView(recipe:recipe)
                                }
                            }
                            
                        }
                        .padding(.horizontal, 32)
                        .padding(.top, 25)
                        .overlay(isSearchFocused ? .white : Color.clear)
                        
                    }
                    .toolbar {
                        
                        
                        ToolbarItem(placement: .navigationBarLeading){
                            Button {
                                withAnimation {
                                    showSideMenu = true
                                }
                            } label: {
                                Image("burgermenu")
                            }
                            .padding(17)
                            .padding(.top, 10)
                            
                        }
                        
                        ToolbarItem(placement: .navigationBarLeading){
                            Text("WHISK")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("purple"))
                                .padding([.leading,.trailing],55)
                                .padding(.top, 10)
                            
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button {
                                
                            } label: {
                                Image("scan")
                            }
                            .padding(17)
                            .padding(.top, 10)
                            
                        }
                        
                        
                        
                        
                    }
                    .navigationBarHidden(isSearchFocused ? true : false)
                    
                    if !isSearchFocused {
                        Button {
                            
                        } label: {
                            Image("fabadd")
                                .shadow(radius: 3)
                        }
                        .padding(.trailing,32)
                        .padding(.bottom,40)
                    }
                    
                }
                
                if showSideMenu {
                    Rectangle()
                        .fill(Color("sidemenugrey").opacity(0.56))
                        .ignoresSafeArea()
                        .animation(.easeInOut(duration: 0.3), value: showSideMenu)
                        .onTapGesture {
                            withAnimation {
                                showSideMenu = false
                            }
                        }
                    
                    
                    SideMenuView(vm: vm)
//                        .offset(x: showSideMenu ? 0 : -200)
//                        .opacity(showSideMenu ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3).delay(0.5), value: showSideMenu)
                        .transition(.move(edge: .leading))
                        
//                        .opacity(showSideMenu ? 1 : 0)
//                        .transition(.move(edge: .leading))
//                        .offset(x: showSideMenu ? 0 : UIScreen.main.bounds.width / 1.5)

                }
                
            }
            
            
        }
//        .scrollIndicators(.hidden)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
