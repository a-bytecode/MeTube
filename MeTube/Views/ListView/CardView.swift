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
        
        VStack(alignment: .leading) {
//            ImageView(video: video, viewModel: viewModel)
            ImageView()
//            TitelView(video: video)
            TitelView()

        }
        
    }
}

//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardView()
//    }
//}

