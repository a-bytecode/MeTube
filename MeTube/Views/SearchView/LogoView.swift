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
            Image("Logo2")
                .padding()
                .foregroundColor(Color.white)
                .font(.title3)
                .multilineTextAlignment(.center)
                .bold()
                .background(LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(.black, lineWidth: 3))
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
