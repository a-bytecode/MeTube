//
//  CommentView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import SwiftUI

struct CommentView: View {
    
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(comment.author)
                .font(.headline)
            Text(comment.message)
                .font(.body)
            Text(comment.timestamp, style: .date)
                .font(.caption)
        }
    }
}

struct ContentView: View {
    let comments = [        Comment(author: "Alice", message: "Hi, how are you?", timestamp: Date()),        Comment(author: "Bob", message: "I'm doing well, thanks for asking!", timestamp: Date()),        Comment(author: "Charlie", message: "Hey guys, what's up?", timestamp: Date())    ]
    
    var body: some View {
        CommentsListView(comments: comments)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment(author: "Alice", message: "Hi, how are you?", timestamp: Date()))
    }
}
