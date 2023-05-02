//
//  MeTubeView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import SwiftUI
import Combine

struct MeTubeView: View {
    
    @StateObject var viewModel = MeTubeViewModel()
    @State private var isEditing = false
    @State private var isSheetOpen = false
    @State private var searchTerm = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {

                ZStack {

            ListView(viewModel: viewModel, inputText: $searchTerm)
                    ParticleEffectView(navigate: $isSheetOpen)
                        .offset(x: 0,y: 360)
                }
            }
        }

    }
}
                   

struct MeTubeView_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeView()
    }
}

