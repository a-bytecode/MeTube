//
//  ButtonSignInView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 21.05.23.
//

import SwiftUI

struct ButtonSignInView: View {
    
    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    @State private var navigate2SignIn = false
    @State var input : String
    @State var searchTerm: String

    
    var body: some View {
        
        NavigationLink(destination: SearchView(input: input, searchTerm: searchTerm)) {
            
            VStack {
                Button(action: {
                    fbViewModel.signUp()
                }, label: {
                    
                    ZStack {
                        Text("Sign up")
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
                Spacer()
                    .frame(height: 50)
                HStack {
                    Text("MeTube Inc. All rights reserved")
                        .font(.footnote)
                        .font(.title2)
                        .bold()
                        .shadow(radius: 2, y: 1)
                        .foregroundColor(Color.white)
                        .offset(y: -12)
                    
                    Image(systemName: "c.circle")
                        .offset(x: -5, y: -12)
                        .foregroundColor(Color.white)
                }
            }
            
        }
        
    }
}

struct ButtonSignInView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSignInView(input: "", searchTerm: "")
    }
}
