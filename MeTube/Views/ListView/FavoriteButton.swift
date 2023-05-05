//
//  FavoriteButton.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 05.05.23.
//

import SwiftUI
import FLAnimatedImage

struct FavoriteButton: View {
    
    @StateObject var settingsViewModel = SettingsViewModel()
    @State var isFav = false
    @State var gradient = LinearGradient(colors: [.blue,.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
    @State private var animationAmount = 1.0
    @State private var isRotating = 0.0
    @State var duration: Double = 3.0
    @State private var pulseAmount = 1.0
    @State var autoreverses = false

    
    @State var url = URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif")
  
    var body: some View {
        
        ZStack {
            
            if isFav == true {
                Rectangle()
                    .frame(width: 40,height: 40)
                    .foregroundColor(Color.blue)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                    .scaleEffect(pulseAmount)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: pulseAmount)
                    .offset(y:-1)
                    .shadow(radius: 4,x: 3,y: 3)

                    .onAppear {
                        pulseAmount = 1.5
                    }

            } else {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 40,height: 40)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                    .offset(y:-1)
                    .shadow(radius: 4,x: 3,y: 3)
            }
            Button(action: {
                // Action für das Favorisieren
                isFav.toggle()
            }) {
                if isFav == true {
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(Color.yellow)
                    
                } else {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(Color.yellow)
                }
                
                
            }
        }
        
//            .onAppear {
//                settingsViewModel.loadAnimatedImage(from: url!)
//            }
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton()
    }
}
