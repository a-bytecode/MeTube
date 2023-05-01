//
//  MeTubeView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import SwiftUI
import Combine

struct MeTubeView: View {
    
    @StateObject var viewModel = MeTubeViewModel()
    @State private var isEditing = false
    @State private var isSheetOpen = false
    @State private var searchTerm = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                ZStack {
                    Spacer()
            ListView(viewModel: viewModel, inputText: $searchTerm)
                    Spacer()
            ParticleEffectView(navigate: $isSheetOpen)
                        .offset(x: 0,y: 370)
                    
        }
//                Spacer()
//                    .toolbar() {
//                        ToolbarItemGroup(placement: .navigationBarTrailing) {
//                            Button(action: {
//                              //TODO: Search
//                                isSheetOpen.toggle()
//                            }) {
//                                Text("Search")
//                                Image(systemName: "magnifyingglass")
//                            }
//                    }
//                }
//
//
//                TabView {
//                    ListView(viewModel: viewModel, inputText: $searchTerm)
//                        .tabItem {
//                            Text("Categorys")
//                            Image(systemName: "book")
//                        }
//                    FavoritenView()
//                        .tabItem {
//                            Text("Favoriten")
//                            Image(systemName: "star")
//                        }
//                    SettingsView()
//                        .tabItem{
//                            Text("Settings")
//                            Image(systemName: "gearshape.2")
//
//                        }
//                }

            }
        }
        .navigationTitle("Search")
            .sheet(isPresented: $isSheetOpen, content: {
                SearchView(viewModel: viewModel, isSheetOpen: $isSheetOpen, searchTerm: $searchTerm)
            })
    }
}
                   

struct MeTubeView_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeView()
    }
}

