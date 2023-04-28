//
//  TitelView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct TitelView: View {
    
    let video : GTLRYouTube_SearchResult

    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [.gray,.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                .frame(width: 400, height: 120)
                .shadow(radius: 5, x: 2,y: 5)
            
            HStack(alignment: .top) {
                
                
                AsyncImage(
                    //                    url: URL(string: video.snippet!.thumbnails!.defaultProperty!.url!),
                    url: URL(string: "https://i.ytimg.com/vi/dMoFcvfd5t4/hqdefault.jpg"),
                    content: { image in
                        image.image?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:150, height: 115)
                            .clipShape(Rectangle())
                            .offset(x: -20)
                            
                        //                            .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.black, lineWidth: 5))
                    })
                
                //                Text(video.snippet!.title ?? "Error")
                Text("Peanut Butter Cookie Fudge Bars - Dished #Shorts")
                    .font(.system(size: 20))
                    .bold()
                    .offset(x: -20)
                    .lineLimit(4)
            }
                
            
        }
    }
}

struct TitelView_Previews: PreviewProvider {
    static var previews: some View {
        TitelView(video: GTLRYouTube_SearchResult())
    }
}
