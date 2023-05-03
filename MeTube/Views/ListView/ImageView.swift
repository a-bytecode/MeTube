//
//  ImageView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct ImageView: View {
    
    let video : GTLRYouTube_SearchResult
    @ObservedObject var viewModel : MeTubeViewModel

    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.yellow,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                .frame(width: 400, height: 300)
                .shadow(radius: 5, x: 2,y: 5)
            
            HStack {
                // AsyncImage wird benutzt um aus dem Internet von der URL das Bild zu ziehen.
                NavigationLink(destination: PlayerView(youTubePlayer: viewModel.youTubePlayer)) {
                    AsyncImage(
                        url: URL(string: video.snippet!.thumbnails!.high!.url!),
                        // url: URL(string: "https://i.ytimg.com/vi/dMoFcvfd5t4/hqdefault.jpg"),
                        content: { image in
                            image.image?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color.white)
                                .frame(width: 350, height: 300)
                                .padding()
                        }).onTapGesture {
                            viewModel.playVideo(videoID: video.identifier!.videoId!)
                        }
                }
            }
        }
        
    }
}

//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView()
//    }
//}
