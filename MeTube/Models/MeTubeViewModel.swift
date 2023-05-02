//
//  MeTubeViewModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import Foundation
import GoogleAPIClientForREST_YouTube // Import durch Cocoapods

class MeTubeViewModel : ObservableObject { // Vorlage durch: https://anthonycodesofficial.medium.com/creating-a-youtube-interface-with-swiftui-using-youtube-api-df616e099726
//
    let secretKey: String = apiKey

    @Published var videos: [GTLRYouTube_SearchResult] = []

    func fetchVideos(term: String) {

        let service = GTLRYouTubeService()

        service.apiKey = secretKey

        let query = GTLRYouTubeQuery_SearchList.query(withPart: ["id","snippet"])

        query.q = term

        query.maxResults = 5

        service.executeQuery(query) { (ticket, response, error) in
        if let error = error { print("Connection Error") } else {
            self.videos = (response as! GTLRYouTube_SearchListResponse).items ?? [] }
//            print(self.videos[0])
        }
    }
}


