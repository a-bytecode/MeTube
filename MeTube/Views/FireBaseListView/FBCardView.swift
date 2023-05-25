//
//  FBCardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI
import YouTubePlayerKit

struct FBCardView: View {
    
    var fbVideo: FirebaseVideo
    @ObservedObject var viewModel: MeTubeViewModel
    
    func getPlayerViewByURL(firebaseVideo: FirebaseVideo) -> PlayerView {
        
        return PlayerView(youTubePlayer: YouTubePlayer(
            source: .url("https://youtube.com/watch?v=\(firebaseVideo.id)"),
            configuration: .init(
                autoPlay: true
            )
        ), firebaseVideo: fbVideo,viewModel: viewModel,fbViewModel: FirebaseViewModel())
    }

    var body: some View {
        NavigationLink(destination: getPlayerViewByURL(firebaseVideo: fbVideo)) {
            
            ZStack {
                
                VStack() {
                    FBImageView(fbVideoImage: fbVideo.img)
                    FBTitelView(fbVideoTitle: fbVideo.title)
                        .offset(y: -29)
                    FavoriteButton()
                        .offset(x:160,y: -83)
                }
            }
            .onAppear {
                print("Video ID Check -> ", fbVideo)
            }
        }
    }
}

//struct FBCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FBCardView(fbVideo: VideoHistory(id: "", list: []) )
//    }
//}
