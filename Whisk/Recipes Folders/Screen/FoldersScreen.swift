//
//  ContentView.swift
//  Whisk
//
//  Created by Nedine on 2/6/23.
//

import SwiftUI


struct FoldersScreen: View {
    
    @StateObject  var vm = FolderViewModel() //habed :)
    @State private var presentAlert = false
    @State private var folderName: String = ""
//    @State private var password: String = ""
    
    
    
    init() {
        if #available(iOS 15, *) {
                        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithOpaqueBackground()
                        navigationBarAppearance.titleTextAttributes = [
                            NSAttributedString.Key.foregroundColor : UIColor(red: 254.0/255, green: 254.0/255, blue: 254.0/255, alpha: 1)
                        ]
                        navigationBarAppearance.backgroundColor =  UIColor(red: 254.0/255, green: 254.0/255, blue: 254.0/255, alpha: 1)
            navigationBarAppearance.shadowColor = .clear

                        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                    

                }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
//    @State var folders = [Folder(name: "Lunch", index: 1), Folder(name: "Breakfast", index: 2), Folder(name: "Dinner", index: 3), Folder(name: "Sushi", index: 4)]

    
    var body: some View {
        NavigationView {
        
                ScrollView {
                    LazyVGrid (columns: columns, spacing: 27) {
//                        ForEach(0..<vm.folders.count,id:\.self) { num in
////                            let index = folders.firstIndex(of: folder)!
//                            NavigationLink {
//                                RecipesScreen()
//                            } label: {
//                                FolderView(folder: vm.folders[num],vm: vm)
//                              //  FolderView(vm: vm, index: num)
//
//                               // FolderView(folder: vm.folders[num])
//
//                            }
//
//                        }
                        
                        
                        ForEach(vm.folders,id: \.name){ folder in
                            NavigationLink {
                                RecipesScreen()
                            } label: {
                                FolderView(folder: folder,vm: vm)
                              //  FolderView(vm: vm, index: num)

                               // FolderView(folder: vm.folders[num])

                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Saved")
                            .font(.largeTitle.bold())
                            .foregroundColor(Color("purple"))
                            .padding(.horizontal, 20)
                    }
                   
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                                               
                        HStack {
                        
                                Menu {
                                    Button("Select Folders", action: {})
                                    Button("Cancel", role: .cancel, action: {})
                                        
                
                                } label: {
                                    Image(systemName: "ellipsis.circle")
                                        .foregroundColor(Color("navy"))
                                }
                                .frame(width: 25, height: 25)

                                Button {
                                    presentAlert = true
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(Color("navy"))
                                }
                                .frame(width: 25, height: 25)
                                .alert("New Folder", isPresented: $presentAlert, actions: {
                                            TextField("Folder", text: $folderName)

                                            Button("Create", action: {
                                                withAnimation{
                                                    vm.folders.append(Folder(name: folderName, index: vm.folders.count+1))
                                                }
                                                
                                                folderName = ""
                                            })
                                            Button("Cancel", role: .cancel, action: {
                                                folderName = ""
                                            })
                                        }, message: {
                                            Text("Enter a name for this folder.")
                                        })
            
                            }
                            .padding(25)
 
                    }
                    
                }
                
        }
       
    }
    
}



struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}


//struct GlowBorder: ViewModifier {
//    var lineWidth: Int
//    var color: Color
//
//    func body(content: Content) -> some View {
//        applyShadow(content: AnyView(content), lineWidth: lineWidth)
//    }
//
//    func applyShadow(content: AnyView, lineWidth: Int) -> AnyView {
//        if lineWidth == 0 {
//            return content
//        } else {
//            return applyShadow(content: AnyView(content.shadow(color: color ,radius: 1)), lineWidth: lineWidth - 1)
//        }
//    }
//}
//
//extension View {
//    func glowBorder(color: Color, lineWidth: Int) -> some View {
//        self.modifier(GlowBorder(lineWidth: lineWidth, color: color))
//    }
//}

struct FolderScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoldersScreen()
    }
}
