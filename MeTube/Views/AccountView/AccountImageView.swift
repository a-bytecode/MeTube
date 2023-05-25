//
//  AccountImageView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.05.23.
//

import SwiftUI

struct AccountImageView: View {
    
    var body: some View {
        
        Image("profileImage")
            .resizable()
            .frame(width: 200, height: 200)
            .background(Color.black)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(LinearGradient(colors: [.yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
    }
}

struct AccountImageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountImageView()
    }
}
