//
//  MeTubeViewModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import Foundation
import GoogleAPIClientForREST_YouTube // Import durch Cocoapods
import YouTubePlayerKit


class MeTubeViewModel : ObservableObject { // Vorlage durch: https://anthonycodesofficial.medium.com/creating-a-youtube-interface-with-swiftui-using-youtube-api-df616e099726
    //
    let secretKey: String = apiKey
        
    @Published var videos: [GTLRYouTube_SearchResult] {

        didSet { // nachdem die Variable verändert worden ist. wird das Ereignis ausgeführt, vergleichbar mit Observer! 

            if !videos.isEmpty {
                for video in videos {
                    fetchComments(videoId: video.identifier?.videoId ?? "Error") // mit map(Dictionarys) wäre eine möglichkeit durch die Liste durch iterrieren.
                    print("Fetched Comments -> \(video.identifier?.videoId ?? "Error")")
                }
            }
        }
    }
    init() {
        self.videos = []
    }
    
    @Published var fbVideos : [FirebaseVideo] = []
        
    @Published var comments: [[GTLRYouTube_CommentSnippet]] = []
        
    func fetchVideos(term: String) {
        print("FBVIDEOS -> \(self.fbVideos.count)")
        let service = GTLRYouTubeService()
        
        service.apiKey = secretKey
        
        let query = GTLRYouTubeQuery_SearchList.query(withPart: ["id","snippet"])
        
        query.q = term
        
        query.maxResults = 20
        
        query.type = ["video"] // Hiermit Filtern wir die Video´s (VideoID) heraus, damit wir keine Ergebnisse der Channel-ID in den Suchergebnissen mit eingbekommen.
        
        service.executeQuery(query) { (ticket, response, error) in
            if let error = error { print("Connection Error")
                
            } else {
                self.videos = (response as! GTLRYouTube_SearchListResponse).items!
                self.fbVideos = self.videos.map( FirebaseVideo.fromGTLRVideo )
                
                print("FBVIDEOS -> \(self.fbVideos.count)")
            }
        }
    }
    
    func fetchComments(videoId: String) {
        
        let service = GTLRYouTubeService()
        
        service.apiKey = secretKey
        
        let query = GTLRYouTubeQuery_CommentThreadsList.query(withPart: ["id","snippet"])
        
        query.videoId = videoId
        
        query.maxResults = 50
        
        service.executeQuery(query) { (ticket, response, error) in
            if let error = error {
                print("Connection Error")
            } else {
                let commentThreads = (response as! GTLRYouTube_CommentThreadListResponse).items ?? []
                var comments: [GTLRYouTube_CommentSnippet] = []
                for commentThread in commentThreads {
                    if let comment = commentThread.snippet?.topLevelComment?.snippet {
                        print("Kommentar Ausgelesen: ----->>> \(comment.textOriginal)")
                        comments.append(comment)
                    }
                }
                self.comments.append(comments)
            }
        }
    }
}


//extension GTLRYouTube_SearchResult { Extension ist dazu da, vorhandene Structs oder Klassen zu erweitern.
//
//    var comments : [GTLRYouTube_CommentSnippet] {
//        return MeTubeViewModel().fetchComments(videoId: (self.identifier?.videoId)!)
//
//    }
//}
