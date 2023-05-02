//
//  ParticleEffectView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 30.04.23.
//

import SwiftUI

struct ParticleEffectView: View {
    
    @ObservedObject private var viewModel = MeTubeViewModel()
    @State private var isLiked: [Bool] = [false, false, false, false]
    @Binding var navigate: Bool
    @State private var isSheetOpen = false
    @State private var shouldNavigate = false
    @State var input = ""

    var body: some View {
        VStack {
            
            HStack(spacing: 20) {
                NavigationLink(destination: SettingsView(), isActive: $navigate){
                    CustomButton(systemImage: "book.fill", status: isLiked[0], activeTint: .green, inActiveTint: .green) {
                        navigate.toggle()
                        isLiked[0].toggle()
                    }
                }
                
                CustomButton(systemImage: "suit.heart.fill", status: isLiked[1], activeTint: .red, inActiveTint: .red) {  isLiked[1].toggle()
                }
                 
                NavigationLink(destination: SearchView(viewModel: viewModel,input: input, isSheetOpen: $isSheetOpen, searchTerm: $input), isActive: $shouldNavigate){
                    CustomButton(systemImage: "sparkle.magnifyingglass", status: isLiked[2], activeTint: .blue, inActiveTint: .blue) {
                        // Action ->
                        shouldNavigate.toggle()
                        isLiked[2].toggle()
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
            if systemImage == "sparkle.magnifyingglass" {
                isSheetOpen.toggle()
            }
        }) {
            Image(systemName: systemImage)
                .resizable()
                .font(.title2)
                .frame(width: 50,height: 40)
                .particleEffect(
                    systemImage: systemImage,
                    font: .title2,
                    status: status,
                    activeTint: activeTint,
                    inActiveTint: inActiveTint)
                .foregroundColor(status ? activeTint : inActiveTint)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background {
                    Capsule()
                        .fill(status ? activeTint.opacity(0.25) : Color("ButtonColor"))
                }
            
        }
    }
    
}

struct ParticleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleEffectView(navigate: .constant(false))
    }
}
