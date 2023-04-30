//
//  ParticleView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 30.04.23.
//

import SwiftUI

//Custom View Modifier

extension View {
    
    @ViewBuilder
    func particleEffect(systemImage: String, font: Font, status: Bool, activeTint: Color, inActiveTint: Color) -> some View {
        self
            .modifier(
            ParticleModifier(systemImage: systemImage, font: font, status: status, activeTint: activeTint, inActiveTint: inActiveTint)
            )
    }
}

fileprivate struct ParticleModifier: ViewModifier {
    var systemImage: String
    var font: Font
    var status: Bool
    var activeTint: Color
    var inActiveTint: Color
    @State private var particles: [Particle] = []
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                ZStack{
                    ForEach(particles) { particle in
                        Image(systemName: systemImage)
                            .foregroundColor(status ? activeTint : inActiveTint)
                            .offset(x: particle.randomX, y: particle.randomY)
                            .opacity(particle.opacity)
                        // Only Visible if Status is inActive
                            .opacity(status ? 1 : 0)
                        //Base Visibility With Zero Animation
                            .animation(.none, value: status)
                        
                    }
                }
                .onAppear {
                if particles.isEmpty {
                    for _ in 0...15 {
                        let particle = Particle()
                        }
                    }
                }
        }
    }
}
