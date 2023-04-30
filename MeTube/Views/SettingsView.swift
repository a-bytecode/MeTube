//
//  SettingsView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import FLAnimatedImage



struct SettingsView: View {
    
    let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif")!
       @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        
        VStack {
            if let image = viewModel.animatedImage {
                            FLAnimatedImageViewWrapper(image: image)
                                .frame(width: 100.0, height: 100.0)
                
                        } else {
                            Text("Loading...")
                        }
                    }
                    .onAppear {
                        viewModel.loadAnimatedImage(from: url)
                    }
        }
}

struct FLAnimatedImageViewWrapper: UIViewRepresentable {
    let image: FLAnimatedImage
    
    func makeUIView(context: Context) -> FLAnimatedImageView {
        let imageView = FLAnimatedImageView()
        imageView.animatedImage = image
        return imageView
    }
    
    func updateUIView(_ uiView: FLAnimatedImageView, context: Context) {
        uiView.animatedImage = image
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
