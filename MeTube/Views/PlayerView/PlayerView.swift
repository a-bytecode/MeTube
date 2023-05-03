//
//  PlayerView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import Foundation
import SwiftUI
import YouTubePlayerKit

struct PlayerView: View {

    @State var youTubePlayer: YouTubePlayer = YouTubePlayer()
    
    var body: some View {
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
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var youTubePlayer = YouTubePlayer(
        source: .url("https://youtube.com/watch?v=psL_5RIBqnY"),
        configuration: .init(
            autoPlay: true
        )
    )
//    youTubePlayer.play()
    static var previews: some View {
        PlayerView(youTubePlayer: youTubePlayer)
    }
}

