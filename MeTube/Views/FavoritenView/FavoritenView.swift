//
//  FavoritenView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import FLAnimatedImage

struct FavoritenView: View {
    
    @StateObject var settingsViewModel : SettingsViewModel = SettingsViewModel()
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!

    
    var body: some View {
                
        ZStack {
            
            if let image = settingsViewModel.animatedImage {
                FLAnimatedImageViewWrapper(image: image)
                    .frame(width: 100.0, height: .infinity)
            } else {
                Text("Loading...")
            }
            
            VStack {
                Spacer()
                    .frame(height: 96)
                FavoritenHeadlineView()
                Spacer()
                    .frame(height: 15)
                
                Button(action: {
                    fbViewModel.logout()
                }, label: {
                    
                    ZStack {
                        Text("Sign out...")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding([.leading,.trailing],20)
                            .cornerRadius(20)
                    }
                    .frame(width: 325,height: 20)
                    .padding([.top,.bottom])
                    .background(Capsule().fill(Color.black).padding(-1))
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
                })
            }
        }
        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}


struct FavoritenView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritenView()
            
    }
}
