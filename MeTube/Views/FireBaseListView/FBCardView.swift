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

    var body: some View {
        NavigationLink(destination: getPlayerViewByFirebaseVideo(firebaseVideo: fbVideo, viewModel: viewModel)) {
            
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
