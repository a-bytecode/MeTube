//
//  CommentListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube


struct CommentListView: View {
    
    
    @ObservedObject var viewModel: MeTubeViewModel
//    let video: GTLRYouTube_Video
    
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.comments, id: \.self) { comments in
                    CommentCardView(comment: comments)
                    }
                }
            }
        }
    }


//struct CommentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentListView(viewModel: MeTubeViewModel())
//    }
//}
