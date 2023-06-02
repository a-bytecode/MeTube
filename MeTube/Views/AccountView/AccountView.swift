//
//  AccountView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.05.23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var settingsViewModel = SettingsViewModel()
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    @State private var isLoggedIn = false
    
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    var body: some View {
        
        ZStack {
            NavigationLink(destination: LoginView(), isActive: $isLoggedIn) {
                               EmptyView()
                           }
            
            if let image = settingsViewModel.animatedImage {
            FLAnimatedImageViewWrapper(image: image)
                .frame(width: 100.0, height: .infinity)
                
            } else {
                Text("Loading...")
                    .font(.title3)
            }
            
            VStack {
                AccountHeadlineView()
                Spacer()
                    .frame(height: 500)
                HStack {
                    Text("Email:")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    Spacer()
                        .frame(width: 20)
                    Text("a@gmail.com")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }.offset(y: -400)
               
                
                
                Button(action: {
                    fbViewModel.logout()
                    isLoggedIn = true
                }, label: {
                    
                    ZStack {
                        Text("Logout")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding([.leading,.trailing],20)
                            .cornerRadius(20)
                    }
                    .frame(width: 225,height: 20)
                    .padding([.top,.bottom])
                    .background(Rectangle().fill(Color.black).padding(-1))
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2).padding(-1))
                }).offset(y: 40)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
        }
    
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(FirebaseViewModel())
    }
}
