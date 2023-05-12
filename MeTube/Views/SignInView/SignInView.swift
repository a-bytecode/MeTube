//
//  SignInView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @State var input : String
    @State var searchTerm: String
    
    var body: some View {
        VStack {
            
            Spacer()
            SignInTFView(input: $fbViewModel.email)
            SignInPWView(input: $fbViewModel.password)
            Spacer()
            
           
                Button(action: {
                    fbViewModel.signUp()
                    NavigationLink(destination: SearchView(input: input, searchTerm: searchTerm)) {
                        SearchView(input: input, searchTerm: searchTerm)
                    }
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(input: "", searchTerm: "")
            .environmentObject(FirebaseViewModel())
    }
}
