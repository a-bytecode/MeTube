//
//  LastSearchResultsView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 10.05.23.
//

import SwiftUI
import GoogleAPIClientForREST_YouTube

struct LastSearchResultsView: View {
    
    @ObservedObject var viewModel = MeTubeViewModel()
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                ForEach(viewModel.lastSearchResults,id: \.self) { lastVideo in
                    CardView(video: lastVideo, viewModel: viewModel)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

//struct LastSearchResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LastSearchResultsView()
//    }
//}
