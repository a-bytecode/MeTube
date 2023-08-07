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
                    fetchComments(videoId: video.identifier?.videoId ?? "Error") // mit map(Dictionaries) wäre eine Möglichkeit durch die Liste durch iterrieren.
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
        
        query.q = term // q ist der SearchTerm, in youtube das Suchabrage Objekt
        
        query.maxResults = 20
        
        query.type = ["video"] // Hiermit Filtern wir die Video´s (VideoID) heraus, damit wir keine Ergebnisse der Channel-ID in den Suchergebnissen mit einbekommen.
        
        service.executeQuery(query) { (ticket, response, error) in
            if let error = error { print("Connection Error")
                
            } else { // Wenn es keine Error Meldung gibt wird die Variable Videos mit den Items aus der API befüllt.
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
                self.comments.append(comments) // mit self. wird auf die Eigenschaft der Instanz auf die Struktur zugegriffen
            }
        }
    }
}
