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
            LoginView()
                 .environmentObject(viewModel)
                 .environmentObject(fbViewModel)
                .onAppear {
                    fbViewModel.checkUser()
                    print("CHeck User ->",fbViewModel.isLoggedIn)
                }
            NavigationLink(destination: SearchView()
                .environmentObject(viewModel)
                .environmentObject(fbViewModel)
                           ,isActive: $fbViewModel.isLoggedIn
            ) {
                EmptyView()
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
