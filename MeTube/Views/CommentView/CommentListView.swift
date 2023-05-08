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
    let videoID: String
    
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.comments, id: \.id) { comment in
                    CommentView(comment: comment)
                }
            }
            .onAppear {
                viewModel.fetchComments(videoId: videoID) {
                    if let comments = comments {
                        viewModel.comments = comments
                    }
                }
            }
        }
    }
}

//struct CommentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentListView()
//    }
//}
