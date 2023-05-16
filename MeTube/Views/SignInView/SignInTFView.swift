//
//  SignInTFView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct SignInTFView: View {
    
    @Binding var input: String
    
    var body: some View {
     
        VStack {
            
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 50)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))

                    TextField("Email", text: $input)
                        .frame(width: .infinity, height: 40)
                        .foregroundColor(Color.white)
                        .tint(Color.red)
                        .accentColor(Color.red)
                        .padding(20)
            }

        }.padding(.horizontal, 30)
        
    }
}

struct SignInTFView_Previews: PreviewProvider {
    static var previews: some View {
        SignInTFView(input: .constant(""))
    }
}
