//
//  LoginTFView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI




struct LoginTFView: View {
    
    @Binding var input: String
    @Binding var showError: Bool
    
    var body: some View {
        
        VStack {
            HStack {
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
                        .placeholder(when: input.isEmpty) {
                            Text("Email")
                                .foregroundColor(Color.white)
                                .offset(x: 20)
                        }
                }
        }
        }.padding(.horizontal, 30)
            .onChange(of: input) { value in
                showError = false // Zurücksetzen des Fehlerstatus bei jeder Änderung der Eingabe
            }
    }
}

struct LoginTFView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTFView(input: .constant(""), showError: .constant(false))
    }
}
