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
            
            ZStack {
                    
                    Text("There are currently no comments available")
                        .padding()
                        .foregroundColor(Color.black)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .bold()
                        .background(LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 3))
                       

                }
//            
//            if let image = settingsViewModel.animatedImage {
//                FLAnimatedImageViewWrapper(image: image)
//                    .frame(width: .zero, height: 100)
//                
//            } else {
//                Text("Loading...")
//            }
            
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
