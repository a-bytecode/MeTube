//
//  LoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @State private var searchTerm = ""
    @State private var input = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            LoginTFView(input: $fbViewModel.email)
            Spacer()
                .frame(height: 1)
            LoginPWView(input: $fbViewModel.password)
            Spacer()
            HStack {
                if fbViewModel.isLoggedIn {
                    NavigationLink(destination: SearchView(input: input, searchTerm: searchTerm)) {
                        SearchView(input: input, searchTerm: searchTerm)
                    }
                } else {
                    Button(action: {
                        fbViewModel.login()
                        NavigationLink(
                            destination: SearchView(input: input, searchTerm: searchTerm),
                            isActive: $fbViewModel.isLoggedIn,
                            label: { EmptyView() }
                        )
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
                  
                        Button(action: {
                            NavigationLink(destination: SignInView(input: input, searchTerm: searchTerm)){
                                SignInView(input: input, searchTerm: searchTerm)
                            }
                        }, label: {
                            
                            ZStack {
                                Text("Sign up")
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(FirebaseViewModel())
    }
}
