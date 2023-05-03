//
//  SearchTextFieldView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 01.05.23.
//

import SwiftUI

struct SearchTextFieldView: View {
    

    @Binding var input : String
    
    var body: some View {
        VStack(alignment: .trailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                TextField("Search", text: $input)
                    .frame(width: .infinity, height: 40)
                    .foregroundColor(Color.white)
                    .padding(20)
               
            }            
        }
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView(input: .constant(""))
    }
}
