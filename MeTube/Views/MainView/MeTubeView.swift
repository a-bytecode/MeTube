//
//  MeTubeView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import SwiftUI
import Combine
import FLAnimatedImage
import GoogleAPIClientForREST_YouTube



struct MeTubeView: View {

    @EnvironmentObject var viewModel : MeTubeViewModel
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var isEditing = false
    @Binding var navigate : Bool
    @State private var searchTerm = ""
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    var body: some View {
        
            ZStack {
                
                if let image = settingsViewModel.animatedImage {
                FLAnimatedImageViewWrapper(image: image)
                    .frame(width: 100.0, height: .infinity)
                
            } else {
                Text("Loading...")
                    .font(.title3)
            }
                
            VStack {
                
                Spacer()
                    .frame(height: 96)
                LastSearchHeadlineView()
                Spacer()
                    .frame(height: 15)
                FBListView(videos: $fbViewModel.videoHistory)
                .frame(width: .infinity, height: 600)

                ParticleEffectView(isEnabled: [true, true, false], navigate: $navigate)
                
                Spacer()
                    .frame(height: 40)

            }
                .onAppear {
                    settingsViewModel.loadAnimatedImage(from: url)
                    fbViewModel.fetchHistory()
                }

            }
            .edgesIgnoringSafeArea(.all)
    }
}
                   

struct MeTubeView_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeView(navigate: .constant(false))
            .environmentObject(MeTubeViewModel())
            .environmentObject(FirebaseViewModel())
    }
}

