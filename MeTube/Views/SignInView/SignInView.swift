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
    @State var input : String
    @State var searchTerm: String
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
                SignInTFView(input: $fbViewModel.email)
                SignInPWView(input: $fbViewModel.password)
                Spacer()
                
                NavigationLink(destination: SearchView(input: input, searchTerm: searchTerm)) {
                    
                    Button(action: {
                        fbViewModel.signUp()
                    }, label: {
                        
                        ZStack {
                            Text("Sign in...")
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
                    })
                    Spacer()
                        .frame(width: 0, height: 100)
                }
            }

        }
        .ignoresSafeArea(.all)

        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(input: "", searchTerm: "")
            .environmentObject(FirebaseViewModel())
    }
}
