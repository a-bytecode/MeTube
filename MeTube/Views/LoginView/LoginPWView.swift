//
//  PWSCView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct LoginPWView: View {
    
    @Binding var input: String
    
    var body: some View {
        
        VStack(alignment: .trailing) {
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
                
            }
            Spacer()
        }.padding(.horizontal, 30)
    }
}

struct PWSCView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPWView(input: .constant(""))
    }
}
