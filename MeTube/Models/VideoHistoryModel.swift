//
//  VideoHistoryModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 22.05.23.
//

import Foundation

struct VideoHistory : Identifiable {
    var id : String
    let videoList : [Any] // "AnyObject" ist weniger Fehleranfällig als "Any"! AnyObject bezieht sich auf Objekte also auf Klassen!
    
    init(id: String, list: [Any]) {
        self.id = id
        self.videoList = list
    }
    
    init(data: [String : Any]) {
        self.id = data["id"] as? String ?? "Not found!"
        self.videoList = data["videoList"] as? [Any] ?? [""]
    }
}
