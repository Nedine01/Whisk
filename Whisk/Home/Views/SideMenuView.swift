//
//  SideMenuView.swift
//  Whisk
//
//  Created by Nedine on 4/20/23.
//

import SwiftUI

struct SideMenuView: View {
    
    @StateObject var vm: HomeScreenViewModel
    @State var linkRequested: String = ""

    
//    @Binding var showSideMenu: Bool
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 15){
            
            //MARK: Profile
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 44))
                                    
                VStack (alignment: .leading, spacing: 3){
                    Text("Othman Shahrouri")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
        
                    Text("Edit")
                        .font(.system(size: 12))
                        .foregroundColor(Color("editcolor"))
                        .fontWeight(.medium)
                        .frame(width: 40, alignment: .leading)
                        .onTapGesture {
                            
                        }
    
                    
                }
                
          
                
            }
            .padding(.top,30)
            
            Rectangle()
                .frame(width: 213, height: 1)
                .foregroundColor(Color("editcolor").opacity(0.39))
            
            Text("BMI Calculator")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.leading,13)
                .frame(width: 200, alignment: .leading)
                .onTapGesture {
                    vm.showSafari = true
                    linkRequested = "bmi"
                }
            
            Rectangle()
                .frame(width: 213, height: 1)
                .foregroundColor(Color("editcolor").opacity(0.39))
            
            Text("TDEE Calculator")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.leading,13)
                .frame(width: 200, alignment: .leading)
                .onTapGesture {
                    vm.showSafari = true
                    linkRequested = "tdee"
                }
            
            Rectangle()
                .frame(width: 213, height: 1)
                .foregroundColor(Color("editcolor").opacity(0.39))
            
            Text("Contact Us")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.leading,13)
                .frame(width: 200, alignment: .leading)
                .onTapGesture {
                    
                }
            
            
            Spacer()
            
            HStack {
                Image("logout")
                
                Text("Log Out")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .frame(height: 40)
                    .onTapGesture {
                        
                    }
            }
//            .padding(.bottom,50)
        }
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background(Color("purple"))
        .foregroundColor(.white)
        .shadow(radius: 10, x:3)
        .sheet(isPresented: $vm.showSafari) {
            if linkRequested == "bmi" {
                SafariView(url: URL(string: "https://www.calculator.net/bmi-calculator.html")!)
            } else {
                SafariView(url: URL(string: "https://www.calculator.net/tdee-calculator.html")!)
            }
        }
  
    }
}

//struct SideMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenuView()
//    }
//}
