//
//  CommentView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct CommentView: View {
    
    let comment: GTLRYouTube_CommentSnippet
    
    var body: some View {
        
        ZStack {

            VStack {
                
                Text(comment.textOriginal ?? "Error")
                    .padding()
                    .background(LinearGradient(colors: [.yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))
                
            }
        }
    }
}

