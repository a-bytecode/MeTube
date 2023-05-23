//
//  FBCardView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 23.05.23.
//

import SwiftUI

struct FBCardView: View {
    
    var body: some View {
        
        ZStack {
            
            VStack() {
                
                // -> Placeholder ****
//                ImageView()
//                TitelView()
//                    .offset(y: -29)
                // -> Placeholder ****
                FBImageView(fbViewModel: <#FirebaseViewModel#>)
                FBTitelView()
                    .offset(y: -29)
                FavoriteButton()
                    .offset(x:160,y: -83)
                
            }
        }
    }
}

struct FBCardView_Previews: PreviewProvider {
    static var previews: some View {
        FBCardView()
    }
}
