//
//  FBCardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI

struct FBCardView: View {
    
    var fbVideoId: String
    
    
    var body: some View {
        
        ZStack {
            
            VStack() {
                
                // -> Placeholder ****
//                ImageView()
//                TitelView()
//                    .offset(y: -29)
                // -> Placeholder ****
                FBImageView(fbVideoId: fbVideoId)
                FBTitelView()
                    .offset(y: -29)
                FavoriteButton()
                    .offset(x:160,y: -83)
                
            }
        }
        .onAppear {
            print("Video ID Check -> ", fbVideoId)
        }
    }
}

struct FBCardView_Previews: PreviewProvider {
    static var previews: some View {
        FBCardView(fbVideoId: "")
    }
}
