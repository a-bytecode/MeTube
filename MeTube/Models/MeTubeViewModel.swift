//
//  MeTubeViewModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import Foundation
import GoogleAPIClientForREST_YouTube // Import durch Cocoapods
import YouTubePlayerKit
import Firebase

class MeTubeViewModel : ObservableObject { // Vorlage durch: https://anthonycodesofficial.medium.com/creating-a-youtube-interface-with-swiftui-using-youtube-api-df616e099726
    //
    let secretKey: String = apiKey
    
    let db = Firestore.firestore()
    
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
                //                self.videos = (response as! GTLRYouTube_SearchListResponse).items ?? [] }
                self.videos = (response as! GTLRYouTube_SearchListResponse).items ?? []
                self.lastSearchResults = self.videos
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
    
    func saveLastSearchResultsToFirebase() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("User is not logged in!")
            return
        }
        
        let searchResultsRef = db.collection("users").document(userId).collection("SearchResults")
        
        searchResultsRef.getDocuments { [weak self] (snapshot, error) in
            guard let strongSelf = self, let documents = snapshot?.documents else {
                print("Failed to fetsch search results: \(error?.localizedDescription ?? "")")
                return
            }
            
            for document in documents {
                document.reference.delete()
            }
        }
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


//extension GTLRYouTube_SearchResult { Extension ist dazu da, vorhandene Structs oder Classen zu erweitern.
//
//    var comments : [GTLRYouTube_CommentSnippet] {
//        print("hallohallohallohallohallohallohallohallohallohallo")
//        return MeTubeViewModel().fetchComments(videoId: (self.identifier?.videoId)!)
//
//    }
//}
