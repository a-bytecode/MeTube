//
//  CommentsListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import SwiftUI

struct CommentsListView: View {
    let comments: [Comment]
    
    var body: some View {
        List(comments) { comment in
            CommentView(comment: comment)
        }
    }
}

//struct CommentsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsListView(comments: )
//    }
//}
