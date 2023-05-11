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

    @StateObject var viewModel = MeTubeViewModel()
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var isEditing = false
    @Binding var navigate : Bool
    @State private var searchTerm = ""
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    //"https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTdkMGZkMGYwMWMyOWUyMjUzYjJiODViZjYxZjgyODE5ZjcyNjI1MSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/fx1XmI9CAxwQ8XWSuB/giphy.gif"
   
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
                LastSearchResultsView(viewModel: viewModel)
                .frame(width: .infinity, height: 600)

                ParticleEffectView(isEnabled: [true, true, false], navigate: $navigate) //isEnabled: [true, true, false],
                Spacer()
                    .frame(height: 40)

            }
                .onAppear {
                    viewModel.fetchVideos(term: searchTerm)
                    settingsViewModel.loadAnimatedImage(from: url)
                }
                .onDisappear {
                    viewModel.saveLastSearchResults()
                }
            }
            .edgesIgnoringSafeArea(.all)
    }
}
                   

struct MeTubeView_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeView(navigate: .constant(false))
    }
}

