//
//  ScalingView.swift
//  Whisk
//
//  Created by Nedine on 2/25/23.
//

import SwiftUI

struct ScalingView: View {

    @State private var scale: Double = 1
    @State private var chosenUnit = "Metric"
    var units = ["Metric", "Imperial"]
    @Binding var show: Bool 
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            HStack {
                Spacer()
                
                
            }
//            .background(.blue)
            
            HStack{
                Text("Scale: \(scale == 1 ? "Default" : "x\(scale)")")
                    .fontWeight(.medium)
                
                Spacer()
                
                Button {
                    withAnimation{
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                }
                .frame(width: 30, height: 30)
//                .background(.blue)
                .offset(y:-15)
                .foregroundColor(Color("purple"))
                .font(.system(size: 20, weight: .semibold))
                
            }
            
            Slider(value: $scale, in: 0.5...10, step: 0.5)
                .tint(Color("purple"))
                .padding(.bottom,10)
            
            Text("Unit")
                .fontWeight(.medium)
            
            Picker("",selection: $chosenUnit){
                ForEach(units, id: \.self){
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
        }
        .foregroundColor(Color("navy"))
        .padding(.horizontal,20)
        .padding(.bottom,25)
        .padding(.top,15)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
     
    
}
//
//struct ScalingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScalingView()
//    }
//}
