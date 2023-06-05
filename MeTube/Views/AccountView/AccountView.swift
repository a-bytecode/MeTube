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
    @State private var isLoggedOut = false
    @State private var userEmail = ""
    @State private var items = 0
    @State private var showingAlert = false

    
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    var body: some View {
        
        ZStack {
            NavigationLink(destination: LoginView(), isActive: $isLoggedOut) {
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
                    .frame(height: 200)
                VStack {
                    HStack {

                        Text("Welcome back!\n\nYou are logged in as: \(userEmail)")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                    HStack {
                        Text("\nItems: \(fbViewModel.videoHistory.count)")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                    }
                }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topTrailing, endPoint: .bottomTrailing))
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    .font(.title2)
                    .bold()
                    .shadow(radius: 2, y: 1)
                    .offset(y: -160)

                Button(action: {
                    fbViewModel.resetHistory()
                    
                }) {
                    Text("Reset Items")
                        .padding(.horizontal, 30)
                        .padding(.vertical, 5)
                        .foregroundColor(Color.white)
                        .background(LinearGradient(colors: [.red,.black], startPoint: .topTrailing, endPoint: .bottomTrailing))
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                        .font(.title2)
                        .bold()
                        .shadow(radius: 2, y: 1)
                }
                .offset(y: -145)
                
                Button(action: {
                    showingAlert = true
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
                })
                .offset(y: 40)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Logout"),
                              message: Text("Möchtest du dich wirklich ausloggen?"),
                              primaryButton: .default(Text("Ja"), action: {
                            fbViewModel.logout()
                            isLoggedOut = true
                        }), secondaryButton: .cancel(Text("Nein")))
                    }
                    .offset(y: 43)
                HStack {
                    Text("MeTube Inc. All rights reserved")
                        .font(.footnote)
                        .font(.title2)
                        .bold()
                        .shadow(radius: 2, y: 1)
                        .foregroundColor(Color.white)

                    Image(systemName: "c.circle")
                        .offset(x: -5)
                        .foregroundColor(Color.white)
                }
                .offset(y: 100)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
            userEmail = fbViewModel.getUserEmail()
        }
    
        
    }

}



struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(FirebaseViewModel())
    }
}
