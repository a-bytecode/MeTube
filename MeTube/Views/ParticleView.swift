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
                .onChange(of: status) { newValue in
                                 if !newValue {
                                     // Reset Animation
                                     for index in particles.indices {
                                         particles[index].reset()
                                        }
                                     } else {
                                         for index in particles.indices {
                                             let total: CGFloat = CGFloat(particles.count)
                                             let progress: CGFloat = CGFloat(index) / total
                                             
                                             let maxX: CGFloat = (progress > 0.5) ? 100 : -100
                                             let maxY: CGFloat = 60
                                             
                                             let randomX: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxX)
                                             let randomY: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxY)
                                             
                                             let randomScale: CGFloat = .random(in: 0.35...1)
                                             
                                             withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                                 // Extra Random Values
                                                 let extraRandomX: CGFloat = (progress < 0.5 ? .random(in: 0...10) : .random(in: -10...0))
                                                 particles[index].randomX = randomX
                                                 particles[index].randomY = randomY
                                             }
                                             // Scaling With Ease animation
                                             withAnimation(.easeInOut(duration: 0.3)) {
                                                 particles[index].scale = randomScale
                                             }
                                             // Removing Particles Based on Index
                                             withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7) .delay(0.25 + (Double(index) * 0.0005))) {
                                                 particles[index].scale = 0.001
                                             }
                                             
                                         }
                                     }
                                 }
                             }
                     }
                 }
                            
    

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleEffectView(navigate: .constant(false))
    }
}
