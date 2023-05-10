//
//  LastSearchResultsView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 10.05.23.
//

import SwiftUI

struct LastSearchHeadlineView: View {
    
    var body: some View {
        
        Text("Previous results")
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
            .foregroundColor(Color.white)
            .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
            .font(.title2)
            .bold()
            .shadow(radius: 2, y: 1)

    }
}

struct LastSearchHeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        LastSearchHeadlineView()
    }
}

