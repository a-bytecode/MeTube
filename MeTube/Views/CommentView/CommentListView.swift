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
    var videoID: String = ""
    var i = MeTubeViewModel().comments.first?.first?.videoId
    var p = MeTubeViewModel().videos.first?.identifier?.videoId

    var comments: [GTLRYouTube_CommentSnippet] {
        viewModel.comments.first(where: {$0.first?.videoId == videoID}) ?? []
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if comments.isEmpty {
                Spacer()
                    .frame(height: 80)
                NoCommentView()
            } else {
                ScrollView(showsIndicators: false) {
                    ForEach(comments, id: \.self) { comment in
                        CommentCardView(comment: comment)
                    }
                }
            }
            
        }
    }
}


struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(viewModel: MeTubeViewModel())
    }
}
