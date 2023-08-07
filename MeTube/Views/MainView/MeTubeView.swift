//
//  MeTubeView.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 28.04.23.
//

import SwiftUI
import Combine
import FLAnimatedImage
import GoogleAPIClientForREST_YouTube

/*
 Anmerk auf Designprinzipien und –guidelines:
  Ich habe versucht die App nach Human Interaction Guidelines Design Prinzipien zu gestalten,
  sodass Benutzer ohne große Anstrengungen mit der App interagieren können.
  Benutzefreundlichkeit, Fingerfreundlichkeit, Erwartungskonformität waren das Hauptaugenmerk der App.
 
 
 Anmerk auf User Orientierung:
 Einfache Benutzeroberfläche, Kontinuierliche Verbesserungen (Updates), wichtig ist es auch Feedback einzuholen nach der Entwicklung, um verbesserungsvorschläge zu bekommen und diese Umzusetzten.
 
 Anmerk auf Problemlösungen wie löst man ein Problem?:
  Debugging, durch Log.d Log.e, Printstatements, durch Kommunikation und Dokumentation. Postings, Code reviews
 
 bei Projektbearbeitung hat geholfen:
 Versionsverwaltung GitHub, Dokumentation des Codes. MVVM Pattern zur Unterteilung des Codes.

 Bei Software Architektur wurde verwendet:
 
 Firebase
 MVVM
 GoogleAPIClientForREST_YouTube (API Service)
 SplashScreen
 YouTube_Player_kit
 
 */

struct MeTubeView: View {

    @EnvironmentObject var viewModel : MeTubeViewModel
    @EnvironmentObject var fbViewModel : FirebaseViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var isEditing = false
    @Binding var navigate : Bool
    @State private var searchTerm = ""
    let url = URL(string: "https://media.giphy.com/media/26hitlJ1tvqhlUWnm/giphy.gif")!
    
    var body: some View {
        
            ZStack {
                
                if let image = settingsViewModel.animatedImage {
                FLAnimatedImageViewWrapper(image: image)
                    .frame(width: 100.0, height: .infinity)
                
            } else {
                Text("Loading...")
                    .font(.title3)
            }
                
            VStack {
                
                Spacer()
                    .frame(height: 96)
                LastSearchHeadlineView()
                Spacer()
                    .frame(height: 15)
                FBListView(videos: $fbViewModel.videoHistory)
                .frame(width: .infinity, height: 600)

                ParticleEffectView(isEnabled: [true, true, false], navigate: $navigate)
                
                Spacer()
                    .frame(height: 40)

            }
                .onAppear {
                    settingsViewModel.loadAnimatedImage(from: url)
                    fbViewModel.fetchHistory()
                }

            }
            .edgesIgnoringSafeArea(.all)
    }
}
                   

struct MeTubeView_Previews: PreviewProvider {
    static var previews: some View {
        MeTubeView(navigate: .constant(false))
            .environmentObject(MeTubeViewModel())
            .environmentObject(FirebaseViewModel())
    }
}

