//
//  LoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var fbViewModel: FirebaseViewModel
    @EnvironmentObject var viewModel: MeTubeViewModel
    @State private var searchTerm = ""
    @State private var input = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            LoginTFView(input: $fbViewModel.email)
            Spacer()
                .frame(height: 1)
            LoginPWView(input: $fbViewModel.password)
            Spacer()
            HStack {
            ButtonsLoginView()
                
                 }
        }.environmentObject(fbViewModel)
         .environmentObject(viewModel)
    }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(FirebaseViewModel())
    }
}
