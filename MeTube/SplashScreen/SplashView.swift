//
//  SplashView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 26.04.23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating = false
    @State private var animationAmount = 1.0
    @State private var isRotating = 0.0
    @State private var duration: Double = 4.0
    @State private var pulseAmount = 1.0
    @State private var autoreverses = false

    var body: some View {
        
        VStack {
            if isAnimating {
                Image("Logo2")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .background(LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(.black, lineWidth: 3))
                    .shadow(radius: 5,x: 2,y: 3)
                    .rotationEffect(.degrees(isRotating))
                    .animation(.easeInOut(duration: duration), value: isRotating)
                    .onAppear {
                        
                        isRotating += 360
                        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                            isAnimating = false
                            NavigationLink(destination: )
                        }
                    }
            }
        }.onAppear {
            isAnimating = true
        }
                }
            }


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
