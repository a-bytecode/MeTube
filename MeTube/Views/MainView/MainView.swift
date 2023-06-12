//
//  MainView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 26.05.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    @State private var isLoggedIn = false
    
    var body: some View {
        
        VStack {
            if fbViewModel.isLoggedIn {
                SearchView()
            } else {
                LoginView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
