//
//  CommentListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube


struct CommentListView: View {
    
    @State var comment : GTLRYouTube_CommentSnippet
    
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                CommentCardView(comment: comment)
                CommentCardView(comment: comment)
                CommentCardView(comment: comment)
                CommentCardView(comment: comment)
                
            }
        }
    }
    
}

//struct CommentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentListView()
//    }
//}
