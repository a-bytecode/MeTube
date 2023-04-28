//
//  SearchView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 27.04.23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel : MeTubeViewModel
    @State var input : String = ""
    @Binding var isSheetOpen : Bool
    @Binding var searchTerm : String
    
    
    var body: some View {
        
        VStack {
            
            Form {
                Section {
                    TextField("Search", text: $input)
            }
                
                Button(action: {
//                    viewModel.fetchVideos(term: input)
                    isSheetOpen.toggle()
                }, label: {
                    ZStack {
                        Capsule()
                        Text("Search...")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                        .cornerRadius(20)}
                    .frame(height: 40)
                })
            }
        }
        
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(viewModel: MeTubeViewModel(), input: "Search", isSheetOpen: .constant(false), searchTerm: .constant("search"))
//    }
//}
