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
        
        VStack(alignment: .trailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 2)
                    )
                TextField("Email", text: $input)
                    .frame(width: .infinity, height: 40)
                    .foregroundColor(Color.red)
                    .tint(Color.red)
                    .accentColor(Color.red)
                    
            }

        }.padding(.horizontal, 50)
    }
}

struct LoginTFView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTFView(input: .constant(""))
    }
}
