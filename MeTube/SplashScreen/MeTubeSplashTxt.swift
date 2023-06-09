//
//  MeTubeSplashTxt.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 09.06.23.
//

import SwiftUI

struct MeTubeSplashTxt: View {
    
    var body: some View {
        HStack {
            Text("MeTube Inc. All rights reserved")
                .font(.footnote)
                .font(.title2)
                .bold()
                .shadow(radius: 2, y: 1)
                .foregroundColor(Color.white)

            Image(systemName: "c.circle")
                .offset(x: -5)
                .foregroundColor(Color.white)
        }
    }
}

struct MeTubeSplashTxt_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeSplashTxt()
    }
}
