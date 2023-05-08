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
    
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.comments, id: \.videoId) { comment in
                    CommentCardView(comment: comment)
                    
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
