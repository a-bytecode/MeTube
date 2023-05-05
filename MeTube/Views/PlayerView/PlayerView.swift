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
    let url = URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif")!
    @State var gradientFill = LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        
            ZStack(alignment: .top){
                
                if let image = settingsViewModel.animatedImage {
                    FLAnimatedImageViewWrapper(image: image)
                        .frame(width: 100.0, height: .infinity)
                    
                } else {
                    Text("Loading...")
                }
                Rectangle()
                    .fill(LinearGradient(colors: [.black,.black], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(width: 400, height: 340)
                    .overlay(Rectangle().stroke(gradientFill, lineWidth: 6))
                    .shadow(radius: 5, x: 2,y: 5)
                VStack(alignment: .trailing){
                    //                Spacer()
                    //                    .frame(height: 100)
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
                    }.frame(width: 500,height: 400)
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

    static var previews: some View {
        PlayerView(youTubePlayer: youTubePlayer)
    }
}

