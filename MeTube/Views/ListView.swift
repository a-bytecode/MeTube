//
//  ListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.04.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct ListView: View {
    
    @ObservedObject var viewModel : MeTubeViewModel
    @Binding var inputText : String
    
    var body: some View {
        
        // TODO: ForEach einsetzten für API Call
        
        VStack {
                
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
                }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: MeTubeViewModel(), inputText: .constant("Whats wrong with bob?"))
    }
}
