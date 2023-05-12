//
//  LoginView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var fbViewModel = FirebaseViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            LoginTFView(input: $fbViewModel.email)
            Spacer()
                .frame(height: 1)
            LoginPWView(input: $fbViewModel.password)
            Spacer()
            ButtonsLoginView(fbViewModel: fbViewModel)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
