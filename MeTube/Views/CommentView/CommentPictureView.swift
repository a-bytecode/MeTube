//
//  CommentPictureView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import SwiftUI

struct CommentPictureView: View {
    
    var body: some View {
        
        Image(systemName: "person.crop.rectangle")
            .resizable()
            .frame(width: 70, height: 60)
            .foregroundColor(Color.black)
    }
    
}

struct CommentPictureView_Previews: PreviewProvider {
    static var previews: some View {
        CommentPictureView()
    }
}
