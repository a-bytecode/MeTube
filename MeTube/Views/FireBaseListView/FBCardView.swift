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

    var body: some View {
        
        ZStack {
            
            VStack() {
                // TODO: mit Prints anschauen was für Daten wo drinnen sind! Mehr mit Prints arbeiten.
                // -> Placeholder ****
//                ImageView()
//                TitelView()
//                    .offset(y: -29)
                // -> Placeholder ****
                // TODO: Try catch um den ganzen Block herumbauen um Crash zu vermeiden!!
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

//struct FBCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FBCardView(fbVideo: VideoHistory(id: "", list: []) )
//    }
//}
