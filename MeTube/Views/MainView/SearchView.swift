//
//  SearchView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 27.04.23.
//

import SwiftUI
import FLAnimatedImage


struct SearchView: View {
    
    @EnvironmentObject var viewModel : MeTubeViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    @State private var input : String = ""
    @State private var searchTerm : String = ""
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
                            onSearchButtonClick()
                            
                        }, label: {
                            
                            ZStack {
                                Text("Search...")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
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
                            onSearchButtonClick()
                        }, label: {
                            
                            ZStack {
                                HStack {

                                    Text("Search")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                    Image(systemName: "doc.text.magnifyingglass")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.white)
                                        
                                    
                                }
                                
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
                    FBListView(videos: $viewModel.fbVideos)

                    Spacer()
                        .frame(height: 20)
                    
                    // Custom TabView
                    ParticleEffectView(navigate: $navigate)
                    Spacer()
                        .frame(height: 30)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden()
            .onAppear {
                print("We are in the SearchView")
                settingsViewModel.loadAnimatedImage(from: url)
                fbViewModel.fetchHistory()
            }
        }
        
    }
    
    func onSearchButtonClick() {
        viewModel.fetchVideos(term: input)
        isClicked = !isClicked
        isLoaded = !isLoaded
        withAnimation {
            scale = 0.5
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(MeTubeViewModel())
            .environmentObject(FirebaseViewModel())
    }
}
