//
//  Editor'sChoiceCardView.swift
//  Whisk
//
//  Created by Nedine on 4/9/23.
//

import SwiftUI

struct Editor_sChoiceCardView: View {
    @State var recipe: Recipe
    var body: some View {
        ZStack(alignment: .trailing) {
            
            Image(recipe.image)
                .cornerRadius(9)
                .frame(width: 321, height: 108)
            

                                             
            ZStack (alignment:.leading){
                Rectangle()
                    .fill(Color("purple").opacity(0.5))
                    .frame(width: 86, height: 94)
                    .cornerRadius(9)
                    .blur(radius: 6)
                    
             
                    VStack (alignment: .leading){
                       
                        Text(recipe.title)
                                .font(.system(size: 10))
                                .fontWeight(.medium)
                                .padding(.bottom,recipe.title.count > 24 ? 0.1 : 9)
                                .padding(.top,10)
                        
                        Spacer()
                  
                        Text("\(recipe.time) Mins | \(recipe.serving) Serving")
                                .font(.system(size: 5))
                                .foregroundColor(Color("greycard"))
                                .padding(.bottom,5)
                                
                            
                        
                    }
                    .padding(.leading,7)
                    .frame(maxWidth: 86,maxHeight: 94, alignment: .bottomLeading)
                    .background(.ultraThinMaterial.opacity(0.85))
                    .cornerRadius(9)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.horizontal,5)
                    
                
    

            }
            .padding(.vertical, 10)
            .padding(.trailing,3)
//            .padding(.top,10)
            
            
            
        }
    }

}

struct Editor_sChoiceCardView_Previews: PreviewProvider {
    static var previews: some View {
        Editor_sChoiceCardView(recipe: Recipe(title: "Hommade Pizza and Pizza Dough", image: "pizza", time: 10, serving: 1))
    }
}
