//
//  MainView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 26.05.23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var fbViewModel: FirebaseViewModel = FirebaseViewModel()
    @StateObject var viewModel: MeTubeViewModel = MeTubeViewModel()
    @State private var isLoggedIn = false
    
    var body: some View {
        
       
            LoginView()
                .environmentObject(viewModel)
                 .environmentObject(fbViewModel)
                .onAppear {
                    fbViewModel.checkUser()
                }
            NavigationLink(destination: SearchView()
                ,isActive: $isLoggedIn
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
