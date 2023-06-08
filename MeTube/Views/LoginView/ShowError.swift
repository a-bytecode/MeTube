//
//  ShowError.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.06.23.
//


import SwiftUI

func showErrorView(showError: Bool) -> some View {
    Text("Invalid login")
        .padding(.horizontal, 50)
        .padding(.vertical, 10)
        .foregroundColor(Color.red)
        .background(LinearGradient(colors: [.black, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 5, x: 5, y: 5)
        .opacity(showError ? 1.0 : 0.0)
}
