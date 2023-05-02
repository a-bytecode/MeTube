//
//  HeadlineTextView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 02.05.23.
//

import SwiftUI

struct HeadlineTextView: View {
    
    var body: some View {
        
        Image("Logo")
            .resizable()
            .frame(width: 220, height: 60)
        
    }
    
}

struct HeadlineTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineTextView()
    }
}
