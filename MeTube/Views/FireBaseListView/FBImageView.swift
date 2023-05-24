//
//  FBImageView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI

struct FBImageView: View {
    
    var fbVideoId: String
        
    var body: some View {
       
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                .frame(width: 400, height: 310)
                .shadow(radius: 5, x: 2,y: 5)
            
            HStack {
                
                // AsyncImage wird benutzt um aus dem Internet von der URL das Bild zu ziehen.
                    AsyncImage(
//                      url: URL(string: video.snippet!.thumbnails!.high!.url!),
                        //-> Placeholder***
                        url: URL(string: fbVideoId),
                        //-> Placeholder***
                        content: { image in
                            image.image?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color.white)
                                .frame(width: 350, height: 300)
                                .padding()
                        })
                
                }
            }
        
    }
}

struct FBImageView_Previews: PreviewProvider {
    static var previews: some View {
        FBImageView(fbVideoId: "")
    }
}
