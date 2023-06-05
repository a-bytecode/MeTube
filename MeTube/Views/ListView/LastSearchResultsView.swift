////
////  LastSearchResultsView.swift
////  MeTube
////
////  Created by Alexander Astrachanzev on 10.05.23.
////
//
//import SwiftUI
//import GoogleAPIClientForREST_YouTube
//import FirebaseFirestore
//
//struct LastSearchResultsView: View {
//
//    @ObservedObject var viewModel : MeTubeViewModel
////    @ObservedObject var fbViewModel : FirebaseViewModel
//
//    var body: some View {
//
//        VStack {
//
//            ScrollView {
//
////                ForEach(fbViewModel.videos ,id: \.self) { lastVideo in
////                    CardView(video: lastVideo.id, viewModel: fbViewModel)
////                }
//            }
//            .edgesIgnoringSafeArea(.all)
//        }
////        .onAppear {
////            fbViewModel.fetchHistory()
////        }
//    }
//}
//
////struct LastSearchResultsView_Previews: PreviewProvider {
////    static var previews: some View {
////        LastSearchResultsView()
////    }
////}
