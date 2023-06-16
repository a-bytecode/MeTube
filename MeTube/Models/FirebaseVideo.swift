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
    var lastAdded: String

    init(data: [String : Any]) {
        id = data["id"] as! String
        img = data["img"] as! String
        title = data["title"] as! String
        isFavorite = (data["isFavorite"] != nil)
        lastWatched = data["lastWatched"] as! String
        lastAdded = data["lastAdded"] as! String
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func fromGTLRVideo(video: GTLRYouTube_SearchResult) -> FirebaseVideo {
        return FirebaseVideo(data: [
            "id":video.identifier?.videoId ?? "",
            "img":video.snippet?.thumbnails?.high?.url!,
            "title":video.snippet?.title,
            "isFavorite":false,
            "lastWatched":"xxxx.xx.xx",
            "lastAdded":"xxxx.xx.xx"]
        )
    }
    
    // Static: Es nimmt die Funktion und macht Sie erreichbar unter FirbaseVideo. (durch Punktnotation) -> Es ist ein ableger vom Klassennamen.
    // Static: Macht nur Sinn innerhalb einer Klasse. Mann könnte Sie einfach außerhalb der Klasse erstellen und es würde auch gehen.
    // Aus Organisatorischen Gründen habe ich Static benutzt damit alles was mit FirebaseVideo zu tun hat in FirebaseVideo ist. Deswegen Static!

}

let firebaseVideoExample = FirebaseVideo(data: [
    "id":"ToyStory",
    "img":"BuzzLightyear",
    "title":"Woody",
    "isFavorite":false,
    "lastWatched":"2023.25.05",
    "lastAdded":"xxxx.xx.xx"])
