//
//  SignInView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var fbViewModel: FirebaseViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            SignInTFView(input: $fbViewModel.email)
            SignInPWView(input: $fbViewModel.password)
            Spacer()
            
            NavigationLink(destination: LoginView(fbViewModel: fbViewModel)) {
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
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(fbViewModel: FirebaseViewModel())
    }
}
