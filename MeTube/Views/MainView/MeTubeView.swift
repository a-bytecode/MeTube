//
//  MeTubeView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import SwiftUI
import Combine
import FLAnimatedImage


struct MeTubeView: View {
    
    @StateObject var viewModel = MeTubeViewModel()
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var isEditing = false
    @State private var isSheetOpen = false
    @State private var searchTerm = ""
    let url = URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif")!
    
    //"https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTdkMGZkMGYwMWMyOWUyMjUzYjJiODViZjYxZjgyODE5ZjcyNjI1MSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/fx1XmI9CAxwQ8XWSuB/giphy.gif"
   
    var body: some View {
        
        NavigationStack {
            
            VStack {

                ZStack {
                    
                    if let image = settingsViewModel.animatedImage {
                        FLAnimatedImageViewWrapper(image: image)
                            .frame(width: 100.0, height: .infinity)
                        
                    } else {
                        Text("Loading...")
                            .font(.title3)
                    }

                    ListView(viewModel: viewModel, inputText: $searchTerm)
                        .frame(width: .infinity, height: 600)
                    ParticleEffectView(navigate: $isSheetOpen)
                        .offset(x: 0,y: 360)
                }
                .onAppear {
                    viewModel.fetchVideos(term: searchTerm)
                    settingsViewModel.loadAnimatedImage(from: url)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
                   

struct MeTubeView_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeView()
    }
}

