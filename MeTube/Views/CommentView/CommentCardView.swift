//
//  CommentCardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct CommentCardView: View {

    let comment : GTLRYouTube_CommentSnippet

    var body: some View {
          
        VStack {
            HStack(alignment: .center) {

                    CommentPictureView(comment: comment)
                    CommentView(comment: comment)
                    Spacer()

                }
                .padding()
                .background(Color.clear)
                .cornerRadius(10)
                .shadow(radius: 2, y: 1)
            }
        .background(Color.clear)
    }

}

