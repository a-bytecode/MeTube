//
//  NoCommentView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 09.05.23.
//

import SwiftUI
import FLAnimatedImage

struct NoCommentView: View {
    
    var gradientFill = LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
    @StateObject var settingsViewModel = SettingsViewModel()
    let url = URL(string: "https://media.giphy.com/media/RHEqKwRZDwFKE/giphy.gif")!

    var body: some View {
        
        VStack {
            
            if let image = settingsViewModel.animatedImage {
                FLAnimatedImageViewWrapper(image: image)
                    .frame(width: 10, height: 100)
                    .padding(.vertical, 50)
                
            } else {
                Text("Loading...")
            }
            
            ZStack {
                    
                    Text("There are currently no comments available")
                        .padding()
                        .frame(width: 350, height: 200)
                        .foregroundColor(Color.black)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .bold()
                        .background(LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 3))
                }
        }
        
        .onAppear {
            settingsViewModel.loadAnimatedImage(from: url)
        }
    }
}

struct NoCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NoCommentView()
    }
}
