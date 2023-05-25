//
//  FBCardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI
import YouTubePlayerKit

struct FBCardView: View {
    
    var fbVideo: VideoHistory
    @ObservedObject var viewModel: MeTubeViewModel
    
    func getPlayerViewByURL(videoID: String) -> PlayerView {
        
        return PlayerView(youTubePlayer: YouTubePlayer(
            source: .url("https://youtube.com/watch?v=\(videoID)"),
            configuration: .init(
                autoPlay: true
            )
        ),videoID: videoID,viewModel: viewModel,fbViewModel: FirebaseViewModel())
    }

    var body: some View {
        NavigationLink(destination: getPlayerViewByURL(videoID: fbVideo.videoList.first as! String ?? "Error")) {
            
            ZStack {
                
                VStack() {
                    FBImageView(fbVideoImage: fbVideo.videoList[2] as! String)
                    FBTitelView(fbVideoTitle: fbVideo.videoList[1] as! String)
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
