//
//  LoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI
import FLAnimatedImage

struct LoginView: View {

    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var searchTerm = ""
    @State private var input = ""
    @State private var showError = false
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
                Text("Login into your account")
                    .fontDesign(.monospaced)
                    .foregroundColor(Color.white)
                    .shadow(radius: 4, x: 1, y: 1)
                    .offset(y: -120)
                LoginTFView(input: $fbViewModel.email)
                    .offset(y: -120)
                LoginPWView(input: $fbViewModel.password, showError: $fbViewModel.showError)
                    .offset(y: -120)
                showErrorView(showError: fbViewModel.showError)
                    .offset(y: -110)
                ButtonsLoginView()
                    .offset(y: -15)
            }.environmentObject(fbViewModel)
             .environmentObject(viewModel)
                
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
        }
    }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(FirebaseViewModel())
            .environmentObject(MeTubeViewModel())
    }
}
