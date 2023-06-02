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
    
    @Published var youTubePlayer: YouTubePlayer = YouTubePlayer()
    
    @Published var comments: [[GTLRYouTube_CommentSnippet]] = []
    
    @Published var lastSearchResults: [GTLRYouTube_SearchResult] = []
    
    func fetchVideos(term: String) {
        
        let service = GTLRYouTubeService()
        
        service.apiKey = secretKey
        
        let query = GTLRYouTubeQuery_SearchList.query(withPart: ["id","snippet"])
        
        query.q = term
        
        query.maxResults = 5
        
        service.executeQuery(query) { (ticket, response, error) in
            if let error = error { print("Connection Error")
                
            } else {
                //self.videos = (response as! GTLRYouTube_SearchListResponse).items ?? [] }
                self.videos = (response as! GTLRYouTube_SearchListResponse).items!
                self.lastSearchResults = self.videos
                self.fbVideos = self.videos.map( FirebaseVideo.fromGTLRVideo )
                
                for video in self.videos {
                    if video.identifier?.videoId != nil {
                        self.fbVideos.append(FirebaseVideo.fromGTLRVideo(video: video))
                    }
                }
//                print("VIDEOS -> \(self.videos.first!.identifier!.videoId!)")
                print("FBVIDEOS -> \(self.fbVideos.count)")
            }
        }
    }
    
    func fetchSearchResults(term: String) {
        let service = GTLRYouTubeService()
        service.apiKey = secretKey
        let query = GTLRYouTubeQuery_SearchList.query(withPart: ["id","snippet"])
        query.q = term
        query.maxResults = 5
        
        service.executeQuery(query) { (ticket, response, error) in
            if let error = error {
                print("Connection Error: \(error)")
            } else if let searchList = response as? GTLRYouTube_SearchListResponse {
                for item in searchList.items ?? [] {
                    
                    if !self.lastSearchResults.contains(item) {
                        self.lastSearchResults.append(item)
                    }
                }
            }
        }
    }
    
    func saveLastSearchResults() {
        self.lastSearchResults = self.videos
    }
    
    func fetchComments(videoId: String) {
        
        let service = GTLRYouTubeService()
        
        service.apiKey = secretKey
        
        let query = GTLRYouTubeQuery_CommentThreadsList.query(withPart: ["id","snippet"])
        
        query.videoId = videoId
        
        query.maxResults = 10
        
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
