//
//  ShowAccExist.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 08.06.23.
//

import Foundation
import SwiftUI


func showAccExist(accExist: Bool) -> some View {
    Text("Account allready exist")
        .padding(.horizontal, 50)
        .padding(.vertical, 10)
        .foregroundColor(Color.yellow)
        .background(LinearGradient(colors: [.black, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 5, x: 5, y: 5)
        .opacity(accExist ? 1.0 : 0.0)
}
