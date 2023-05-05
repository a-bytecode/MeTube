//
//  CardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct CardView: View {
    
//    let video : GTLRYouTube_SearchResult
//    @ObservedObject var viewModel : MeTubeViewModel
    
    var body: some View {
        
        ZStack {
            VStack() {
                //            ImageView(video: video, viewModel: viewModel)
                
                //            TitelView(video: video)
                ImageView()
                TitelView()
                    .offset(y: -29)
                FavoriteButton()
                    .offset(x:160,y: -83)
                
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {

    static var previews: some View {
        CardView()
    }
}
