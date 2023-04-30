//
//  ParticleEffectView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 30.04.23.
//

import SwiftUI

struct ParticleEffectView: View {
    
    @State private var isLiked: [Bool] = [false, false, false]

    var body: some View {
        VStack {
            
            HStack(spacing: 20) {
                CustomButton(systemImage: "book.fill", status: isLiked[0], activeTint: .green, inActiveTint: .gray) {
                    isLiked[0].toggle()
                }
                
                CustomButton(systemImage: "suit.heart.fill", status: isLiked[1], activeTint: .red, inActiveTint: .gray) {  isLiked[1].toggle()
                }
                
                CustomButton(systemImage: "gearshape.2.fill", status: isLiked[2], activeTint: .blue, inActiveTint: .gray) {  isLiked[2].toggle()
                }
                
            }
        }
    }
    
    @ViewBuilder
    func CustomButton(systemImage: String, status: Bool, activeTint: Color, inActiveTint: Color, onTap: @escaping () -> ()) -> some View {
        Button(action: onTap) {
            Image(systemName: systemImage)
                .font(.title2)
                .foregroundColor(status ? activeTint : inActiveTint)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background {
                    Capsule()
                        .fill(status ? activeTint.opacity(0.25) : Color("ButtonColor"))
                }
            
        }
    }
    
}

struct ParticleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleEffectView()
    }
}
