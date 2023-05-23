//
//  FBTitelView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI

struct FBTitelView: View {
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [.yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                .frame(width: 400, height: 120)
                .shadow(radius: 5, x: 2,y: 5)
            
            HStack() {
                
                // -> Placeholder***
                Text("Peanut Butter Cookie Fudge Bars - Dished #Shorts")
                //-> Placeholder***
                
//                Text(video.snippet!.title ?? "Error")
                    .font(.system(size: 22))
                    .bold()
                    .lineLimit(4)
                    .padding([.trailing,.leading])
            
            }
        }
    }
}

struct FBTitelView_Previews: PreviewProvider {
    static var previews: some View {
        FBTitelView()
    }
}
