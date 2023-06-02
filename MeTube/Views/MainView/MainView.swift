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
    @State private var searchTerm = ""
    @State private var input = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        
        NavigationStack {
            LoginView()
                .onAppear {
                    fbViewModel.checkUser()
                }
            NavigationLink(destination: SearchView(input: input, searchTerm: searchTerm)
                ,isActive: $isLoggedIn
            ) {
                EmptyView()
            }
        }.environmentObject(viewModel)
         .environmentObject(fbViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
