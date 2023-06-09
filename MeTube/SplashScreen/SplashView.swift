//
//  SplashView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 26.04.23.
//

import SwiftUI

struct SplashView: View {
    
    //TODO: Splashsscreen mit Navigation sicherstellen.
    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    @State private var isAnimating = false
    @State private var isDone = false
    @State private var animationAmount = 1.0
    @State private var isRotating = 0.0
    @State private var duration: Double = 4.0
    @State private var pulseAmount = 1.0
    @State private var autoreverses = false
    @StateObject var settingsViewModel: SettingsViewModel = SettingsViewModel()
    @State private var logoPositionY: CGFloat = -500
    @State private var logoPositionX: CGFloat = -50
    @State private var audioPLayer = AudioPlayer()
    private var url = URL(string: "https://media.giphy.com/media/XnKIErV7AL3GS7xs8N/giphy.gif")!


    var body: some View {
            
            VStack {
                if isDone {
                    MainView()
                } else {
                    ZStack {
                        if let image = settingsViewModel.animatedImage {
                            FLAnimatedImageViewWrapper(image: image)
                                .frame(width: 100, height: .infinity)
                        } else {
                            Text("Loading...")
                        }
                        VStack {
                            
                            if isAnimating {
                                Image("Logo2")
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                    .background(LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .clipShape(Rectangle())
                                    .overlay(Rectangle().stroke(.black, lineWidth: 3))
                                    .shadow(radius: 5,x: 2,y: 3)
                                    .rotationEffect(.degrees(isRotating))
                                    .offset(x: logoPositionX, y: logoPositionY)
                                    .animation(.easeInOut(duration: duration), value: isRotating)
                                    .onAppear {
                                        let sound1 = "streets1_000"
                                        audioPLayer.playSound(soundFileName: sound1, soundFileType: "mp3")
                                        isRotating += 360
                                        withAnimation(.easeInOut(duration: duration)) {
                                                    logoPositionY = UIScreen.main.bounds.height / 40
                                                    logoPositionX = 0
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                            isAnimating = false
                                            isDone = true
                                        }
                                    }
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .environmentObject(fbViewModel)
                    .environmentObject(viewModel)
                    .onAppear {
                        isAnimating = true
                        settingsViewModel.loadAnimatedImage(from: url)
                        fbViewModel.checkUser()
                    }
                }
            }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
