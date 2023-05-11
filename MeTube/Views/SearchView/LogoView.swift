//
//  LogoView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 10.05.23.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image("Logo")
                .padding()
                .foregroundColor(Color.black)
                .font(.title3)
                .multilineTextAlignment(.center)
                .bold()
                .background(LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 3))
                .shadow(radius: 5,x: 2,y: 3)
            Spacer()

        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
