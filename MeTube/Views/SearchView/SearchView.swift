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
    
    @Binding var input : String
    @Binding var isSheetOpen : Bool
    @Binding var searchTerm : String
    
    let url = URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif")!
    
    // Oder:
    //https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif
    
    

    var body: some View {
        
       
            ZStack {
                
                if let image = settingsViewModel.animatedImage {
                    FLAnimatedImageViewWrapper(image: image)
                        .frame(width: 100.0, height: .infinity)
                    
                } else {
                    Text("Loading...")
                }
                
                VStack {
//                    Spacer()
                SearchTextFieldView(input: $input)
                        .padding([.leading,.trailing])
                
                
                    Button(action: {
                        viewModel.fetchVideos(term: input)
                    }, label: {
                        ZStack {
                            Text("Search...")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.leading,.trailing],20)
                            .cornerRadius(20)}
                        .frame(width: 325,height: 20)
                        .padding([.top,.bottom])
                        .background(Capsule().fill(Color.black).padding(-1))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
                    })
                    Spacer()
                        .frame(height: 20)

                // Listenansicht
                ListView(viewModel: viewModel, inputText: $searchTerm)
                    .frame(width: .infinity, height: 500)
//                    Spacer()
//                        .frame(height: 30)
                
                // Custom TabView
                ParticleEffectView(isEnabled: [true, true, false], navigate: $isSheetOpen)
                    
                            .onAppear {
                                settingsViewModel.loadAnimatedImage(from: url)
                            }
            }

        }
            .edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: MeTubeViewModel(), input: .constant(""),isSheetOpen: .constant(false), searchTerm: .constant(""))
            .environmentObject(MeTubeViewModel())
    }
}
