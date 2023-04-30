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
    let url = URL(string: "https://media.giphy.com/media/g04lCCTUHSw03W7pqD/giphy.gif")!    
    

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
                    ForEach(viewModel.videos, id: \.self) { video in
                        
                        //                        CardView(video: video)
                        CardView()
                            .onTapGesture {
                                
                            }
                    }
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
