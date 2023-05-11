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
    @State var input : String
    @State var searchTerm : String
    @State var navigate = false
    @State var isLoaded = false
    @State private var animationAmount = 1.0
    @State private var isRotating = 0.0
    @State var duration: Double = 3.0
    @State private var pulseAmount = 1.0
    @State var autoreverses = false
    @State var isClicked = false
    @State var repeatCount = 1
    @State var scale = 1.0
    
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    // Oder:
    //https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif
    
    //https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif
    //"https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTA5Mjg3ZDRjYWQyMTIyZDYzMjFlM2IxNGI2ZTc5NWZiOGVlZjQyYyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/loFCCDeZR3S8qov02A/giphy.gif"

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                if let image = settingsViewModel.animatedImage {
                    FLAnimatedImageViewWrapper(image: image)
                        .frame(width: 100.0, height: .infinity)
                    
                } else {
                    Text("Loading...")
                }
                
                VStack {
                    Spacer()
                        .frame(height: 90)
                    
                    SearchTextFieldView(input: $input)
                        .padding([.leading,.trailing])
                    
                    if isClicked {
                        Button(action: {
                            viewModel.fetchVideos(term: input)
                            viewModel.fetchSearchResults(term: input)
                            
                        }, label: {
                            
                            ZStack {
                                Text("Search...")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding([.leading,.trailing],20)
                                    .cornerRadius(20)
                            }
                            .frame(width: 325,height: 20)
                            .padding([.top,.bottom])
                            .background(Capsule().fill(Color.black).padding(-1))
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
                            .scaleEffect(scale)
                            .animation(.spring(), value: isClicked)
                            .onAppear{
                                isClicked = false
                                isLoaded = false
                                withAnimation {
                                    scale = 1.0
                                }
                            }
                        })
                        
                    } else {
                        Button(action: {
                            viewModel.fetchVideos(term: input)
                            viewModel.fetchSearchResults(term: input)
                            isClicked = true
                            isLoaded = false
                            withAnimation {
                                scale = 0.5
                            }
                        }, label: {
                            
                            ZStack {
                                Text("Search...")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding([.leading,.trailing],20)
                                    .cornerRadius(20)
                            }
                            .frame(width: 325,height: 20)
                            .padding([.top,.bottom])
                            .background(Capsule().fill(Color.black).padding(-1))
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
                            .scaleEffect(scale)
                            .animation(.spring(), value: isClicked)
                        })
                    }

                    Spacer()
                        .frame(height: 12)
                    // Listenansicht
                    ListView(viewModel: viewModel, inputText: $searchTerm)
                    //                    .frame(width: .infinity, height: 300)
                    Spacer()
                        .frame(height: 20)
                    
                    // Custom TabView
                    ParticleEffectView(navigate: $navigate)
                    Spacer()
                        .frame(height: 30)
                        .onAppear {
                            settingsViewModel.loadAnimatedImage(from: url)
                        }
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: MeTubeViewModel(), input: "",searchTerm: "")
            .environmentObject(MeTubeViewModel())
    }
}
