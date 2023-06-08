//
//  SignInPWView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct SignInPWView: View {
    
    @Binding var input: String
    @Binding var accAccepted : Bool
    @Binding var accExist : Bool
    
    var body: some View {
        
        VStack {

            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 50)
                    .overlay(
                        Rectangle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                SecureField("Password", text: $input)
                    .frame(width: .infinity, height: 40)
                    .foregroundColor(Color.white)
                    .tint(Color.red)
                    .accentColor(Color.red)
                    .padding(20)
                    .placeholder(when: input.isEmpty) {
                        Text("Password")
                            .foregroundColor(Color.white)
                            .offset(x:20)
                    }
            }
            if accAccepted {
                Text("Account created")
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.yellow)
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 5, x: 5,y: 5)
            }
            if accExist {
                Text("Account allready exist")
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.red)
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 5, x: 5,y: 5)
            }
            
        }.padding(.horizontal, 30)
            .onChange(of: input) { value in
                accAccepted = false
                accExist = false
            }
    }
}

struct SignInPWView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPWView(input: .constant(""), accAccepted: .constant(false), accExist: .constant(false))
    }
}
