//
//  ParticleEffectView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 30.04.23.
//

import SwiftUI

struct ParticleEffectView: View {
    
    @ObservedObject var viewModel : MeTubeViewModel
    @State private var isLiked: [Bool] = [false, false, false]
    var isEnabled: [Bool] = [true, true, true]
    @Binding var navigate: Bool
    @State private var isSheetOpen = false
    @State private var shouldNavigateMeTubeView = false
    @State private var shouldNavigate = false
    @State private var navigateFav = false
    @State var input = ""

    var body: some View {
        
        VStack {
            
            HStack(spacing: 20) {
                
                // Navigation Book
                NavigationLink(destination: PlayerView(viewModel: viewModel), isActive: $navigate){
                    if isEnabled[0] {
                        CustomButton(systemImage: "video.fill", status: isLiked[0], activeTint: .green, inActiveTint: .green) {
                            navigate.toggle()
                            isLiked[0].toggle()
                        }
                    } else {
                        CustomButton(systemImage: "book.fill", status: isLiked[0], activeTint: .green, inActiveTint: .green) {                            
                        }
                    }
                }
                
                // Navigation Favoriten
                NavigationLink(destination: FavoritenView(), isActive: $navigateFav){
                    if isEnabled[1] {
                        CustomButton(systemImage: "suit.heart.fill", status: isLiked[1], activeTint: .red, inActiveTint: .red) {
                            isLiked[1].toggle()
                        }
                    } else {
                        CustomButton(systemImage: "suit.heart.fill", status: isLiked[1], activeTint: .red, inActiveTint: .red) {
                            // Empty
                        }
                    }
                }
                
                // Navigation Search
                NavigationLink(destination: MeTubeView(viewModel: viewModel, navigate: $isSheetOpen), isActive: $shouldNavigateMeTubeView){
                    if isEnabled[2] {
                        CustomButton(systemImage: "arrowshape.turn.up.right.fill", status: isLiked[2], activeTint: .blue, inActiveTint: .blue) {
                            shouldNavigateMeTubeView.toggle()
                            isLiked[2].toggle()
                        }
                    } else {
                        CustomButton(systemImage: "arrowshape.turn.up.right.fill", status: isLiked[2], activeTint: .blue, inActiveTint: .blue) {
                            // Action ->
                            // Empty
                        }
                    }
                }
                
            }
            .background(Rectangle().fill(Color.black).padding(-10))
            .overlay(Rectangle().stroke(Color.white, lineWidth: 2).padding(-10))
//                .sheet(isPresented: $isSheetOpen, content: {
//                    SearchView(viewModel: viewModel, isSheetOpen: $isSheetOpen, searchTerm: $input)
//                })
        }
    }
    
    @ViewBuilder
    func CustomButton(systemImage: String, status: Bool, activeTint: Color, inActiveTint: Color, onTap: @escaping () -> ()) -> some View {
        Button(action: {
            onTap()
            if systemImage == "arrowshape.turn.up.right.fill" {
//                isSheetOpen.toggle()
            }
            if systemImage == "suit.heart.fill" {
                navigateFav.toggle()
            }

        }) {
            Image(systemName: systemImage)
                .resizable()
                .font(.title2)
                .frame(width: 50,height: 40)
                .foregroundColor(status ? activeTint : inActiveTint)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)            
        }
    }
    
}
struct ParticleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleEffectView(viewModel: MeTubeViewModel(), isEnabled: [true,true,true], navigate: .constant(false))
    }
}
