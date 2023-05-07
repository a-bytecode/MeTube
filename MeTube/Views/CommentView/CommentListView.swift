//
//  CommentListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.05.23.
//

import SwiftUI

struct CommentListView: View {
    
    
    var body: some View {
        
        VStack {
            ScrollView {
                CommentCardView()
                CommentCardView()
                CommentCardView()
                CommentCardView()
                CommentCardView()
                CommentCardView()
                CommentCardView()
            }
        }
    }
    
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView()
    }
}
