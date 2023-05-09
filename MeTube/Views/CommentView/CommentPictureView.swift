//
//  CommentPictureView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct CommentPictureView: View {
    
    let comment: GTLRYouTube_CommentSnippet

    var body: some View {
        
        AsyncImage(
            url: URL(string: comment.authorProfileImageUrl ?? "Error"),
            content: { image in
                image.image?
                    .resizable()
                    .frame(width: 70, height: 60)
                    .foregroundColor(Color.black)
            })
    }
    
}

//struct CommentPictureView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentPictureView(comment: "")
//    }
//}
