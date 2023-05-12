//
//  ButtonsLoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct ButtonsLoginView: View {
    
    @StateObject var fbViewModel: FirebaseViewModel
    
    var body: some View {
        
        HStack {
            if fbViewModel.isLoggedIn {
//                NavigationLink(destination: SearchView(input: , searchTerm: <#T##String#>))
            } else {
                
            }
            Button(action: {
                fbViewModel.login()
            }, label: {
                
                ZStack {
                    Text("Login")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding([.leading,.trailing],20)
                        .cornerRadius(20)
                }
                .frame(width: 150,height: 20)
                .padding([.top,.bottom])
                .background(Capsule().fill(Color.black).padding(-1))
                .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
            })
            NavigationLink(destination: SignInView(fbViewModel: fbViewModel)){
                Button(action: {
                    
                }, label: {
                    
                    ZStack {
                        Text("Register")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding([.leading,.trailing],20)
                            .cornerRadius(20)
                    }
                    .frame(width: 150,height: 20)
                    .padding([.top,.bottom])
                    .background(Capsule().fill(Color.black).padding(-1))
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2).padding(-1))
                })
            }
        }
        
    }
}

struct ButtonsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsLoginView(fbViewModel: FirebaseViewModel())
    }
}
