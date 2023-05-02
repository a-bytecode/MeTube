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
    
    let url = URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif")!
    
    // Oder:
    //https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif
    
    

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
                        //viewModel.fetchVideos(term: input)
                        //isSheetOpen.toggle()
                    }, label: {
                        ZStack {
                            Text("Search...")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(20)
                            .cornerRadius(20)}
                        .frame(width: 325,height: 20)
                        .padding()
                        .background(Capsule().fill(Color.black).padding(-1))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
                    }).offset(x: 0,y: -220)
                
                // Listenansicht
                ListView(viewModel: viewModel, inputText: $input)
                    .offset(x: 0 , y: 238)
                
                // Custom TabView
                ParticleEffectView(isEnabled: [true, true, false], navigate: $isSheetOpen)
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
