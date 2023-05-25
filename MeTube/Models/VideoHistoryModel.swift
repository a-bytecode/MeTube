//
//  VideoHistoryModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 22.05.23.
//

import Foundation

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
}
