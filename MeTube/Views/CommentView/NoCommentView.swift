//
//  NoCommentView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 09.05.23.
//

import SwiftUI

struct NoCommentView: View {
    
    var gradientFill = LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(gradientFill)
                .frame(width: 300, height: 200)
                .overlay(Rectangle().stroke(.black, lineWidth: 3))
                .shadow(radius: 5, x: 2,y: 2)
            Text("No Comment Section!")
                .frame(width: 300, height: 200)
                .foregroundColor(Color.black)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .shadow(radius: 1, x: 1,y: 1)
        }
    }
}
struct NoCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NoCommentView()
    }
}
