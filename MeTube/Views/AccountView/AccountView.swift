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
    @State private var userEmail = ""
    @State private var items = 1
    @State private var showingAlert = false

    
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
                    .frame(height: 300)
                VStack {
                    HStack {

                        
                        Text("Welcome back!\nYou are logged in as: \(userEmail)")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                            .frame(width: 20)
                        
                    }
                    HStack {
                        Text("\nItems: \(items)")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)

                        Spacer()
                            .frame(width: 20)
                        
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
                    .offset(y: -250)

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
                }.offset(y: -230)
                
                Button(action: {
                    fbViewModel.logout()
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
                }).offset(y: 40)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Logout"),
                              message: Text("Möchtest du dich wirklich ausloggen?"),
                              primaryButton: .default(Text("Ja"), action: {
                            isLoggedIn = true
                        }), secondaryButton: .cancel(Text("Nein")))
                    }
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
                }.offset(y: 93)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
            userEmail = fbViewModel.getUserEmail()
            items = fbViewModel.videoHistory.count
        }
    
        
    }

}



struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(FirebaseViewModel())
    }
}
