//
//  Comment.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 07.05.23.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let author: String
    let message: String
    let timestamp: Date
}
