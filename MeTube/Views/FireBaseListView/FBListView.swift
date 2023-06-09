//
//  FBListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI
import YouTubePlayerKit

struct FBListView: View {
    @Binding var videos: [FirebaseVideo]
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    @EnvironmentObject var viewModel : MeTubeViewModel
    
    var body: some View {
        
            VStack {
                
                ZStack {
                    
                    ScrollView {
                       
                        ForEach(videos, id: \.self) { video in
                            
                            FBCardView(fbVideo: video)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        
    }

struct FBListView_Previews: PreviewProvider {
    static var previews: some View {
        FBListView(videos: .constant([firebaseVideoExample]))
    }
}
