//
//  FolderView.swift
//  Whisk
//
//  Created by Nedine on 2/8/23.
//

import SwiftUI

struct FolderView: View {
//    @State var index:Int

    @State var folder: Folder
    @ObservedObject var vm:FolderViewModel //different instance
//    @State var index:Int
    
//    let index = folder.firstIndex(of: folder)!
    var body: some View {
        VStack(alignment: .leading, spacing:2) {
           
            
            HStack {
                Spacer()
                Menu {
                    Button("Rename", action: {})
                    Button("Delete", action: {
//                        folders.remove(atOffsets: folder.index-1)
                        vm.removeFolder(folder: folder)
                        //Sol1
//                        vm.folders.remove(atOffsets: IndexSet(integer: folder.index - 1))
                        
                        
                        
                    })
                        
                } label: {
                    Image("dots2")
                        .frame(width: 20, height: 20)
                }
//                .frame(width: 20, height: 20)
                .overlay(
                    Image("dots2")
                        .frame(width: 20, height: 20)
                )
//                .background(.red)
               
            }
            .padding(.horizontal,5)
            .padding(.top, 10)
//            .background(.red)
            
            HStack(spacing: 12) {
                Text("\(folder.index)")

                StrokeText(text: "\( folder.index)", width: 0.5, color: Color("purple"))
                           .foregroundColor(Color("yellow"))
                           .font(.system(size: 18, weight: .bold))
                
                Text(folder.name)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                

            }
            .padding(.horizontal)
            .padding(.bottom, 4)
            .offset(y: -10)
           
            Rectangle()
                .fill(Color("lightgrey").opacity(0.5))
                .frame(width: 59,height: 1)
                .padding(.horizontal)
                .padding(.bottom, 2)
                .offset(y: -3)
            
//            Divider()
//                .background(Color("lightgrey"))
//                .frame(maxWidth: 59)
//                .padding(.horizontal)
//                .padding(.bottom, 4)
            
            
            
            Text("\(folder.numOfRecipe) recipes")
                .font(.system(size: 10))
                .foregroundColor(Color("lightgrey"))
                .padding(.horizontal)
                .padding(.bottom, 10)
                .offset(y: -3)
            
         
                
        }
        .frame(width: 144, height: 79)
        .background(Color("grey"))
        .clipShape(RoundedRectangle(cornerRadius: 9))
        
        .overlay(
            RoundedRectangle(cornerRadius: 9)
                .strokeBorder(Color("purple"), lineWidth: 2)
            
        )
    }
}
//
//struct FolderView_Previews: PreviewProvider {
//    static var previews: some View {
//        FolderView(folder: Folder(name: "Lunch", index: 1), index: <#Int#>, vm: FolderViewModel())
//    }
//}
