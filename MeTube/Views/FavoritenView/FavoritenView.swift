//
//  FavoritenView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import FLAnimatedImage

struct FavoritenView: View {
    
    @StateObject var settingsViewModel : SettingsViewModel = SettingsViewModel()
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!

    var body: some View {
                
        ZStack {
            
            if let image = settingsViewModel.animatedImage {
                FLAnimatedImageViewWrapper(image: image)
                    .frame(width: 100.0, height: .infinity)
            } else {
                Text("Loading...")
            }
            
            VStack {
                Spacer()
                    .frame(height: 96)
                FavoritenHeadlineView()
                Spacer()
                    .frame(height: 15)
                FBListView(videos: $fbViewModel.favorites)
            }
        }
        .onAppear {
            fbViewModel.getFavorites()
            settingsViewModel.loadAnimatedImage(from: url)
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}


struct FavoritenView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritenView()
            .environmentObject(FirebaseViewModel())
            .environmentObject(MeTubeViewModel())
    }
}
