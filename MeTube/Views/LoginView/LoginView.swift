//
//  LoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var fbViewModel = FirebaseViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            LoginTFView(input: $fbViewModel.email)
            Spacer()
                .frame(height: 1)
            PWSCView(input: $fbViewModel.password)
            Spacer()
            
            Button(action: {
                fbViewModel.saveToFireStore()
                
            }, label: {
                
                ZStack {
                    Text("Login...")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
