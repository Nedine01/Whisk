//
//  cardFlip.swift
//  Whisk
//
//  Created by Nedine on 3/24/23.
//

import SwiftUI

struct cardFlip: View {
    @State private var isFlipped = false

        var body: some View {
            VStack {
                if isFlipped {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: 200, height: 300)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 200, height: 300)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isFlipped.toggle()
                }
            }
        }
}

struct cardFlip_Previews: PreviewProvider {
    static var previews: some View {
        cardFlip()
    }
}
