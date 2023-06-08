//
//  SignInView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI
import FLAnimatedImage

struct SignInView: View {
    
    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    var body: some View {
        
        ZStack {
            
            if let image = settingsViewModel.animatedImage {
                FLAnimatedImageViewWrapper(image: image)
                    .frame(width: 100.0, height: .infinity)
                
            } else {
                Text("Loading...")
            }
            
            VStack {
                Spacer()
                    .frame(height: 100)
                LogoView()
                Text("Register your Account")
                    .fontDesign(.monospaced)
                    .foregroundColor(Color.white)
                    .shadow(radius: 4, x: 1, y: 1)
                SignInTFView(input: $fbViewModel.email)
                SignInPWView(input: $fbViewModel.password, accAccepted: $fbViewModel.accAccepted, accExist: $fbViewModel.accExist)

                ButtonSignInView()

            }
            .onAppear {
                settingsViewModel.loadAnimatedImage(from: url)
            }
            }
        
        .ignoresSafeArea(.all)

        }
        
        
    }

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(FirebaseViewModel())
    }
}
