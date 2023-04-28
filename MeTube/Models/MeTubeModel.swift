//
//  MeTubeModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import Foundation

struct YoutubeSearchListResponse: Codable {
    let kind: String
    let etag: String
    let nextPageToken: String?
    let regionCode: String
    let pageInfo: PageInfo
    let items: [YoutubeVideo]
}

struct PageInfo: Codable {
    let totalResults: Int
    let resultsPerPage: Int
}

struct YoutubeVideo: Codable {
    let kind: String
    let etag: String
    let id: YoutubeVideoId
    let snippet: YoutubeVideoSnippet
}

struct YoutubeVideoId: Codable {
    let kind: String
    let videoId: String
}

struct YoutubeVideoSnippet: Codable {
    let publishedAt: String
    let channelId: String
    let title: String
    let description: String
    let thumbnails: YoutubeThumbnails
    let channelTitle: String
    let liveBroadcastContent: String
    let publishTime: String
}

struct YoutubeThumbnails: Codable {
    let `default`: YoutubeThumbnail
    let medium: YoutubeThumbnail
    let high: YoutubeThumbnail
}

struct YoutubeThumbnail: Codable {
    let url: String
    let width: Int
    let height: Int
}
