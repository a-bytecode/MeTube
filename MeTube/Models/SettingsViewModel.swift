//
//  SettingsViewModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 30.04.23.
//

import Foundation
import FLAnimatedImage

class SettingsViewModel: ObservableObject {
    @Published var animatedImage: FLAnimatedImage?
    
    func loadAnimatedImage(from url: URL) {
        if let imageData = try? Data(contentsOf: url) {
            animatedImage = FLAnimatedImage(animatedGIFData: imageData)
        }
    }
}
