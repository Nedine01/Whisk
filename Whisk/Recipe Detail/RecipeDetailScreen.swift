//
//  RecipeDetailScreen.swift
//  Whisk
//
//  Created by Nedine on 2/14/23.
//

import SwiftUI

struct RecipeDetailScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selection = "Scale"
    let scales = ["1", "2", "3", "4", "5"]
    let ingredients = ["1 1/2 cups flour","3 1/2 baking powder","1 Tbsp white sugar","1/4 tsp salt","1 1/4 cups milk", "3 Tbsp butter, melted","1 egg"]
    @State private var show: Bool = false
    var body: some View {
        VStack (alignment:.leading){
            
            Image("pancake1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 349)
                .cornerRadius(1)
                .padding(.bottom,8)
                .overlay(
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()

                        } label: {
                            Image("back")
                        }
                        .padding(.top, 30)

                        Spacer()


                    }
                    .padding(),alignment: .top

                )
            
        
            
            HStack {
                
                Text("Good Old-Fashioned Pancakes")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("navy"))
                
                Spacer()
                
                Image("share")
            }
            .padding(.horizontal, 20)
            
            HStack {
                
                //scale button
                HStack {
                    Button {
                        withAnimation{
                            show.toggle()
                        }
                       
                    } label: {
                        
                        HStack {
                            
                            Text("Scale and Unit")
                                .font(.system(size: 10))
                                .fontWeight(.medium)
                                .foregroundColor(Color("navy"))
                            
                            
                        }
                        
                    }
                    
                       
                }
                .frame(height: 22)
                .padding(.horizontal,10)
                .background(Color("purple").opacity(0.08))
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color("purple").opacity(0.08))
                )
                
                
                
                
                HStack {
                
                    Text("10 Mins")
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                            
                }
                .frame(width: 65, height: 22)
                .background(Color("purple"))
                .clipShape(Capsule())
                

            }
            .padding(.horizontal,20)
            
            VStack (alignment: .leading){
                HStack {
                    Text("Ingredients")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("navy"))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("available")
                    }
                }
                .padding(.bottom,15)
                
                ZStack(alignment: .bottom){
                    
                    ScrollView{
                        
                        ForEach(ingredients, id: \.self) { ingredient in
                            VStack {
                                HStack {
                                    Button {
                                        
                                    } label: {
                                        Image("plusbutton")
                                    }
                                    .padding(.trailing,5)
                                    
                                    
                                    
                                    Button {
                                        
                                    } label: {
                                        Text(ingredient)
                                            .foregroundColor(Color("navy"))
                                        Spacer()
                                        Image("ingarrow")
                                        
                                    }
                                }
                                Divider()
                            }
                            
                        }
                    }
                    .frame(height: 268)
                    
                    if show {
                       
                        ScalingView(show: $show)
                            .transition(.move(edge: .bottom))
                        
                    }
                    
                }
                
               
                    
                    Button {
                        
                    } label: {
                        
                        Image("startcooking")
                        
                            .padding(.vertical,10)
                            .padding(.bottom,45)
                            .offset(x:5)
                    }
                    
                   

              
            }
            .padding(.horizontal,20)
            .padding(.top,10)

        }
        .navigationBarBackButtonHidden(true)

    }
}

struct RecipeDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailScreen()
    }
}
