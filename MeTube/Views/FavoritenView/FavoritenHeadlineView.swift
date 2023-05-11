//
//  FavoritenHeadlineView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 11.05.23.
//

import SwiftUI

struct FavoritenHeadlineView: View {
    
    
    var body: some View {
        
       
            HStack {
                ZStack {
                
                Text("Favorites")
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    .font(.title2)
                    .bold()
                    .shadow(radius: 2, y: 1)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(Color.red)
                        .frame(width: 21,height: 21)
                        .offset(x: 70)
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(Color.red)
                        .frame(width: 21,height: 21)
                        .offset(x: -70)
                        
            }
        }
    }
    
    
}

struct FavoritenHeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritenHeadlineView()
    }
}
