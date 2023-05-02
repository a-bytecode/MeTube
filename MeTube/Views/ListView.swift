//
//  ListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import FLAnimatedImage
import GoogleAPIClientForREST_YouTube

struct ListView: View {
    
    @ObservedObject var viewModel : MeTubeViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    let url = URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTdkMGZkMGYwMWMyOWUyMjUzYjJiODViZjYxZjgyODE5ZjcyNjI1MSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/fx1XmI9CAxwQ8XWSuB/giphy.gif")!
    

    @Binding var inputText : String
    
    var body: some View {
        
        // TODO: ForEach einsetzten für API Call
        
        VStack {
            
            ZStack {
                if let image = settingsViewModel.animatedImage {
                    FLAnimatedImageViewWrapper(image: image)
                        .frame(width: 100.0, height: .infinity)
                    
                } else {
                    Text("Loading...")
                }
                
                ScrollView {
//                    ForEach(viewModel.videos, id: \.self) { video in
//
////                            CardView(video: video)
//                        CardView()
//
//                    }
                    CardView()
                    CardView()
                    CardView()
                    CardView()
                }
                .onAppear {
                    viewModel.fetchVideos(term: inputText)
                    settingsViewModel.loadAnimatedImage(from: url)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: MeTubeViewModel(), inputText: .constant("Whats wrong with bob?"))
    }
}
