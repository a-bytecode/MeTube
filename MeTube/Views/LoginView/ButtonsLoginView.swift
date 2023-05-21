//
//  ButtonsLoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct ButtonsLoginView: View {
    
    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    @State private var navigate2SignUp = false
    @State private var searchTerm = ""
    @State private var input = ""
    
    var body: some View {
        
        VStack {
            

            HStack {
                
                Button(action: {
                    fbViewModel.login()
                }, label: {
                    NavigationLink(
                        destination: SearchView(input: input, searchTerm: searchTerm)
                        .environmentObject(fbViewModel).environmentObject(viewModel),
                        isActive: $fbViewModel.isLoggedIn,
                        label: { ZStack {
                            Text("Login")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.leading,.trailing],20)
                                .cornerRadius(20)
                        }
                        .frame(width: 150,height: 20)
                        .padding([.top,.bottom])
                        .background(Rectangle().fill(Color.black).padding(-1))
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 2).padding(-1)) }
                    )
                    
                })
                
                Button(action: {
                    print("Check 12")
                    navigate2SignUp.toggle()
                }, label: {
                    NavigationLink(destination: SignInView(input: input, searchTerm: searchTerm).environmentObject(fbViewModel), isActive: $navigate2SignUp){
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
                        .background(Rectangle().fill(Color.black).padding(-1))
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2).padding(-1))
                    }
                    
                })
            }
            Spacer()
                .frame(height: 50)
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
        }
    }
    
}
struct ButtonsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsLoginView()
            .environmentObject(FirebaseViewModel())
            .environmentObject(MeTubeViewModel())
    }
}
