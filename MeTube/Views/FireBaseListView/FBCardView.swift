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
    @EnvironmentObject var viewModel: MeTubeViewModel
    @EnvironmentObject var fbViewModel : FirebaseViewModel

    var body: some View {
        NavigationLink(destination: getPlayerViewByFirebaseVideo(firebaseVideo: fbVideo, viewModel: viewModel, fbViewModel: fbViewModel)) {
            
            ZStack {
                
                VStack() {
                    FBImageView(fbVideoImage: fbVideo.img)
                    FBTitelView(fbVideoTitle: fbVideo.title)
                    
                        .offset(y: -29)
                    FavoriteButton(firebaseVideo: fbVideo, isFav: fbViewModel.favorites.contains(fbVideo))
                        .offset(x:160,y: -83)
                }
            }
            .onAppear {
                print("Video ID Check -> ", fbVideo)
            }
        }
    }
}

