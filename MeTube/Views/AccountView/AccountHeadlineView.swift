//
//  AccountHeadlineView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 25.05.23.
//

import SwiftUI

struct AccountHeadlineView: View {
    
    var body: some View {
        ZStack {
            
            HStack {

                    Text("Account-Info")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25))
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        
                }.padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    .font(.title2)
                    .bold()
                    .shadow(radius: 2, y: 1)

        }
    }
        
}

struct AccountHeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHeadlineView()
    }
}
