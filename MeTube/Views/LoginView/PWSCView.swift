//
//  PWSCView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct PWSCView: View {
    
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
                SecureField("Password", text: $input)
                    .frame(width: .infinity, height: 40)
                    .foregroundColor(Color.white)
                    .padding(20)
            }
        }.padding(.horizontal, 50)
    }
}

struct PWSCView_Previews: PreviewProvider {
    static var previews: some View {
        PWSCView(input: .constant(""))
    }
}
