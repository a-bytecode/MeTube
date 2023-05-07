//
//  CommentCardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.05.23.
//

import SwiftUI

struct CommentCardView: View {
    
    var body: some View {
        
        ZStack {
            
            HStack {
                CommentPictureView()
                CommentView()
            }
        }
    }
    
}

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCardView()
    }
}
