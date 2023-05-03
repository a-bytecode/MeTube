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
    @Binding var inputText : String
    
    var body: some View {
        
        // TODO: ForEach einsetzten für API Call
        
        VStack {
            
            ZStack {
                
                ScrollView {
                    ForEach(viewModel.videos, id: \.self) { video in

                        CardView(video: video, viewModel: viewModel)
            
                    }
//                    CardView()
//                    CardView()
//                    CardView()
//                    CardView()
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
