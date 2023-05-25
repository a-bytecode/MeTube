//
//  FBListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI
import YouTubePlayerKit

struct FBListView: View {
    
    @ObservedObject var fbViewModel : FirebaseViewModel
    @ObservedObject var viewModel : MeTubeViewModel
    
    var body: some View {
        
            VStack {
                
                ZStack {
                    
                    ScrollView {
                       
                        ForEach(fbViewModel.videoHistory, id: \.self) { video in
                            
                            FBCardView(fbVideo: video, viewModel: viewModel)
//                            Text("\(video.videoList.count)")
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        
    }

struct FBListView_Previews: PreviewProvider {
    static var previews: some View {
        FBListView(fbViewModel: FirebaseViewModel(), viewModel: MeTubeViewModel())
    }
}
