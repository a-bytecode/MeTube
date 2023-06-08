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
                    .offset(y: -80)
                SignInTFView(input: $fbViewModel.email)
                    .offset(y: -80)
                SignInPWView(input: $fbViewModel.password, accExist: $fbViewModel.accExist)
                    .offset(y: -80)
                showAccAccepted(accAccepted: fbViewModel.accAccepted)
                    .offset(y: -70)
                showAccExist(accExist: fbViewModel.accExist)
                    .offset(y: -120)
                ButtonSignInView()
                    .offset(y: -20)
                HStack {
                    Text("MeTube Inc. All rights reserved")
                        .font(.footnote)
                        .font(.title2)
                        .bold()
                        .shadow(radius: 2, y: 1)
                        .foregroundColor(Color.white)
                        .offset(y: -15)
                    
                    Image(systemName: "c.circle")
                        .offset(x: -5, y: -12)
                        .foregroundColor(Color.white)
                }

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
