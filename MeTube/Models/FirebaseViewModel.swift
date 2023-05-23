//
//  FirebaseViewModel.swift
//  MeTube
//
//  Created by Alexander Astrachanzev on 12.05.23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SwiftUI

class FirebaseViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var videos = [VideoHistory]()
    let userId = Auth.auth().currentUser!.uid
    
    
    //    init() {
    //        checkUser()
    //        print("CHECK LOGGED IN STATUS: \(isLoggedIn)")
    //    }
    
    func fetchHistory() {
        
        let ref = db.collection("Users").document(userId).collection("watchHistory")
        print("Referenz!!",ref)
        let listener = ref.addSnapshotListener { [self] querySnapshot, error in
            print("Start fetching History!!!!")
            if let error = error {
                print("Snapshot error: \(error)")
                return
            }
            
            for document in querySnapshot!.documents {
                let data = document.data()
                let video = VideoHistory(data: data)
                print("DATA ------->>>",data)
                if !videos.contains(where: { $0.id == video.id }) {
                    videos.append(video)
                    print("FetchHistory ------> \(video)")
                }
            }
        }
    }
    
    func saveVideoFirebase(video: VideoHistory) { // TODO: Funktion muss noch gemacht werden um das Video zu erstellen, es müssen die Sachen aus der API herausgenommen werden und es muss nach der richtigen Rheinfolge erstellt werden.
        
        db.collection("Users").document(userId).collection("watchHistory").document(video.id).setData([
            "id": video.id,
            "videoList": video.videoList]) { error in
            if let error = error {
                print("error writing \(error)")
                return
            } else {
                print("written")
            }
        }
    }
    
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            
            guard let strongSelf = self else {return}
            
            if error == nil && authResult != nil {
                
                strongSelf.db.collection("lastSearchResults").document() // Wir möchten ein weiteres Document erstellen wo die letzten Suchergebnisse beinhaltet. In dem Document müssen alle Attribute sein die ein Video Suchergebnis hat: "VideoID","Thumbnail","Titel","Favorit"
                
                let docRef = strongSelf.db.collection("Users").document(authResult?.user.uid ?? "No ID")
                
                let datas = ["email" : authResult?.user.email, "uid": authResult?.user.uid, "displayName": authResult?.user.displayName]
                
                docRef.setData(datas)
                
            }
            else {
                print ("Error...")
            }
        }
    }
    
    func login() {
        print("Speichert...")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                print("Login fehlgeschlagen: \(error.localizedDescription)")
                
            } else {
                print("Login successfully as: \(authResult?.user.email ?? "")")
                self.isLoggedIn = true
            }
        }
    }
    
    func logout() {
        
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
        } catch let signOutError as NSError {
            print("Fehler beim ausloggen: %@", signOutError)
        }
    }
    
    func checkUser() {
        if Auth.auth().currentUser != nil {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
}


