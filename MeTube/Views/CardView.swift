//
//  CardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct CardView: View {
    
    let video : GTLRYouTube_SearchResult
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ImageView(video: video)
            TitelView(video: video)

        }
        
    }
}

//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardView()
//    }
//}

