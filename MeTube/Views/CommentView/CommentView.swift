//
//  CommentView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct CommentView: View {
    
//    let comment: GTLRYouTube_CommentSnippet
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Text("Hallo, hier ist meine Nachricht!")
                    .padding()
                    .background(LinearGradient(colors: [.yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))

                
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
