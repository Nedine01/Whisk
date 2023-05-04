//
//  ShoppingItemCardView.swift
//  Whisk
//
//  Created by Nedine on 4/7/23.
//

import SwiftUI

struct ShoppingItemCardView: View {
    
    @State var item: Item

    var body: some View {
        
     

               
            ZStack(alignment: .leading) {
                        
                //Capsule shape
                        HStack {
                            VStack (alignment: .leading){
                                Text(item.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("navy"))
                                    .font(.system(size: 10))
                                    .offset(x:7)
                                    .frame(width: 55, alignment: .leading) //freaking yesssss (to fix the position of text regardless of letter count)

                            }
                            

                           
                        }
                        .frame(width: 94, height: 22)
                        .background(Color("purple").opacity(0.08))
                        .clipShape(Capsule())
                        
                //Checkmark shape
                        ZStack{
                            Circle()
                                .fill(item.isCompleted ? Color("yellow") : .white)
                                .frame(width: 28, height: 28)
                                .onTapGesture{
                                    item.isCompleted.toggle()
                                }
                                .overlay(
                                    Circle()
                                        .stroke(Color("yellow"), lineWidth: 2)
                                )
                            
                            if item.isCompleted {
                                
                                Image("Tick")
                                    .foregroundColor(.white)
                                    .font(.system(size:13))
   
                            }
                        }
                        .offset(x:-10)
                    }
            .onAppear{
                print(item.title)
            }

           
         
        
    }
}

struct ShoppingItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemCardView(item: Item(title: "Olive oil", isCompleted: false))
    }
}
