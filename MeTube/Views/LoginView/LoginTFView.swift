//
//  LoginTFView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct LoginTFView: View {
    
    @Binding var input: String
    
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 50)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    
                    if input == "" {
                        Text("Email")
                            .foregroundColor(Color.white)
                            .offset(x: -120)
                        TextField("Email", text: $input)
                            .frame(width: .infinity, height: 40)
                            .foregroundColor(Color.white)
                            .tint(Color.red)
                            .accentColor(Color.red)
                            .padding(20)
                } else {
                    TextField("Email", text: $input)
                        .frame(width: .infinity, height: 40)
                        .foregroundColor(Color.white)
                        .tint(Color.red)
                        .accentColor(Color.red)
                        .padding(20)
                }
            }
        }

        }.padding(.horizontal, 30)
    }
}

struct LoginTFView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTFView(input: .constant(""))
    }
}
