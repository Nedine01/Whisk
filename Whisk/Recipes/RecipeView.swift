//
//  RecipeView.swift
//  Whisk
//
//  Created by Nedine on 2/10/23.
//

import SwiftUI

struct RecipeView: View {
    @State var recipe: Recipe
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Image(recipe.image)
                .cornerRadius(9)
                .frame(width: 155.23, height: 187)
            

                                             
            ZStack (alignment:.leading){
                Rectangle()
                    .fill(Color("purple").opacity(0.5))
                    .frame(width: 135, height: 43)
                    .cornerRadius(9)
                    .blur(radius: 6)
                    
             
                    VStack (alignment: .leading){
                       
                        Text(recipe.title)
                                .font(.system(size: 10))
                                .fontWeight(.medium)
                                .padding(.bottom,recipe.title.count > 24 ? 0.1 : 9)
                  
                        Text("\(recipe.time) Mins | \(recipe.serving) Serving")
                                .font(.system(size: 5))
                                .foregroundColor(Color("greycard"))
                                .padding(.bottom,5)
                                
                            
                        
                    }
                    .padding(.leading,7)
                    .frame(maxWidth: 135,maxHeight: 43, alignment: .bottomLeading)
                    .background(.ultraThinMaterial.opacity(0.85))
                    .cornerRadius(9)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.horizontal,5)
                    
                
    

            }
            .padding(.bottom, 10)
            
            
            
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe(title: "Good Old-Fashioned Pancakes", image: "pancake1", time: 10, serving: 1))
    }
}
