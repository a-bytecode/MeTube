//
//  getPlayerViewByFirebaseVideo.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.05.23.
//

import Foundation



func getPlayerViewByURL(firebaseVideo: FirebaseVideo) -> PlayerView {
    

    
    return PlayerView(youTubePlayer: YouTubePlayer(
        source: .url("https://youtube.com/watch?v=\(firebaseVideo.id)"),
        configuration: .init(
            autoPlay: true
        )
    ), firebaseVideo: firebaseVideo,viewModel: viewModel,fbViewModel: FirebaseViewModel())
}
