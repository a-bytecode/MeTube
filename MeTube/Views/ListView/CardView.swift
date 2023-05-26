////
////  CardView.swift
////  MeTube
////
////  Created by Alexander Astrachanzev on 25.04.23.
////
//
//import SwiftUI
//import GoogleAPIClientForREST_YouTube
//
//struct CardView: View {
//    
//    let video : GTLRYouTube_SearchResult
//    @ObservedObject var viewModel : MeTubeViewModel
//    @ObservedObject var fbViewModel = FirebaseViewModel()
//    
//    var body: some View {
//        
//        ZStack {
//            VStack() {
//                
//                ImageView(video: video, viewModel: viewModel)
//                TitelView(video: video)
//                    .offset(y: -29)
//                FavoriteButton(fbViewModel: fbViewModel, viewModel: viewModel, firebaseVideo: FirebaseVideo(data: [
//                    "id":video.identifier?.videoId,
//                    "img":video.snippet?.thumbnails?.high?.url!,
//                    "title":video.snippet?.title,
//                    "isFavorite":false,
//                    "lastWatched":"2023.25.05"]))
//                    .offset(x:160,y: -83)
//                
//            }
//        }
//    }
//}
//
////struct CardView_Previews: PreviewProvider {
////
////    static var previews: some View {
////        CardView()
////    }
////}
//
