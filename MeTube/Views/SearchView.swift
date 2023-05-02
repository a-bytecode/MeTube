//
//  SearchView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 27.04.23.
//

import SwiftUI
import FLAnimatedImage


struct SearchView: View {
    
    @ObservedObject var viewModel : MeTubeViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    @State var input : String = ""
    @Binding var isSheetOpen : Bool
    @Binding var searchTerm : String
    
    let url = URL(string: "https://media.giphy.com/media/g04lCCTUHSw03W7pqD/giphy.gif")!
    

    var body: some View {
        
        VStack {
            ZStack {
                    
                    if let image = settingsViewModel.animatedImage {
                        FLAnimatedImageViewWrapper(image: image)
                            .frame(width: 100.0, height: .infinity)
                        
                    } else {
                        Text("Loading...")
                    }
                
                SearchTextFieldView()
                    .offset(x: 0,y: -300)
                    .padding()
                
                    Button(action: {
                        //                    viewModel.fetchVideos(term: input)
//                        isSheetOpen.toggle()
                    }, label: {
                        ZStack {
                            Text("Search...")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(50)
                            .cornerRadius(20)}
                        .frame(height: 40)
                        .padding()
                        .background(Capsule().fill(Color.black).padding(-5))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-5))
                    }).offset(x: 0,y: -180)
            
                ParticleEffectView(navigate: $isSheetOpen)
                            .offset(x: 0,y: 360)
                            .onAppear {
                                settingsViewModel.loadAnimatedImage(from: url)
                            }
            }
            .edgesIgnoringSafeArea(.all)

               
                           

        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: MeTubeViewModel(), input: "Search", isSheetOpen: .constant(false), searchTerm: .constant("search"))
    }
}
