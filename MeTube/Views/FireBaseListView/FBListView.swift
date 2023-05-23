//
//  FBListView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI

struct FBListView: View {
    
    @ObservedObject var fbViewModel : FirebaseViewModel
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                ScrollView {
                    ForEach(fbViewModel.videos, id: \.self) { video in

                        FBCardView()
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
    }
    
}

struct FBListView_Previews: PreviewProvider {
    static var previews: some View {
        FBListView(fbViewModel: FirebaseViewModel())
    }
}
