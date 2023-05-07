//
//  PlayerView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import Foundation
import SwiftUI
import YouTubePlayerKit
import FLAnimatedImage

struct PlayerView: View {

    @State var youTubePlayer: YouTubePlayer = YouTubePlayer()
    @StateObject var settingsViewModel = SettingsViewModel()
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    @State var gradientFill = LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNDhhYmEwZWY1MzU4MzU1NDhmNGI1NGNkOGY2M2EwYzg0NjE1MGEyYiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/LP62GF82YvcuOuFJRD/giphy.gif
    
    var body: some View {
        
            ZStack(alignment: .top){
                
                if let image = settingsViewModel.animatedImage {
                    FLAnimatedImageViewWrapper(image: image)
                        .frame(width: .infinity, height: .infinity)
                    
                    
                } else {
                    Text("Loading...")
                }

                Rectangle()
                    .fill(gradientFill)
                    .frame(width: 400, height: 323)
                    .overlay(Rectangle().stroke(.black, lineWidth: 2))
                    .shadow(radius: 5, x: 2,y: 5)
                    .offset(y: 100)
                
                VStack(alignment: .trailing){
                        Spacer()
                        .frame(height: 96)
                       
                    YouTubePlayerView(self.youTubePlayer) { state in
                        // Overlay ViewBuilder closure to place an overlay View
                        // for the current `YouTubePlayer.State`
                        switch state {
                        case .idle:
                            ProgressView()
                        case .ready:
                            EmptyView()
                        case .error(let error):
                            Text(verbatim: "YouTube player couldn't be loaded")
                        }
                    }.frame(width: 400,height: 300)
                        .padding()
                }
                .onAppear {
                    settingsViewModel.loadAnimatedImage(from: url)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }


struct PlayerView_Previews: PreviewProvider {
    static var youTubePlayer = YouTubePlayer(
        source: .url(""),
        configuration: .init(
            autoPlay: true
        )
    )
    //https://www.youtube.com/watch?v=aYYSlCa3xfw

    static var previews: some View {
        PlayerView(youTubePlayer: youTubePlayer)
    }
}

