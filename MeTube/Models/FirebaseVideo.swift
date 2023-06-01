//
//  VideoHistoryModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 22.05.23.
//

import Foundation
import GoogleAPIClientForREST_YouTube

struct FirebaseVideo : Hashable, Identifiable {
    static func == (lhs: FirebaseVideo, rhs: FirebaseVideo) -> Bool {
      return lhs.id == rhs.id
    }
    
    var id : String
    var img: String
    var title: String
    var isFavorite: Bool
    var lastWatched: String // = "2023-05-25"

    
    init(data: [String : Any]) {
        id = data["id"] as! String
        img = data["img"] as! String
        title = data["title"] as! String
        isFavorite = (data["isFavorite"] != nil)
        lastWatched = data["lastWatched"] as! String
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func fromGTLRVideo(video: GTLRYouTube_SearchResult) -> FirebaseVideo {
        return FirebaseVideo(data: [
            "id":video.identifier?.videoId!,
            "img":video.snippet?.thumbnails?.high?.url!,
            "title":video.snippet?.title,
            "isFavorite":false,
            "lastWatched":"2023.25.05"]
        )
    }
}

let firebaseVideoExample = FirebaseVideo(data: [
    "id":"ToyStory",
    "img":"BuzzLightyear",
    "title":"Woody",
    "isFavorite":false,
    "lastWatched":"2023.25.05"])
