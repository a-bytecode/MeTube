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
    
    var body: some View {
        
            VStack {
                
                ZStack {
                    
                    ScrollView {
                       
                        ForEach(fbViewModel.videos, id: \.self) { video in
                            
                            FBCardView(fbVideo: video)
                        }
                        // -> Placeolder****
                        //                    CardView()
                        //                    CardView()
                        //                    CardView()
                        //                    CardView()
                        // -> Placeolder****
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                print("FBVIEWMODEL is EMPTY?",fbViewModel.videos)
            }
        }
        
    }

struct FBListView_Previews: PreviewProvider {
    static var previews: some View {
        FBListView(fbViewModel: FirebaseViewModel())
    }
}
