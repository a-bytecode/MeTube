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

class FirebaseViewModel: ObservableObject { // TODO: Alles auf Firebase umstellen als zentralen Speicherort, APICall auf den Firesotore umleiten!!!
    
    let db = Firestore.firestore()
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var videoHistory = [FirebaseVideo]()
    @Published var favorites = [FirebaseVideo]()
    @Published var searchResults = [FirebaseVideo]()
    @Published var showError: Bool = false
    @Published var accAccepted : Bool = false
    @Published var accExist : Bool = false
    var userId : String?
    
    
    init() {
        print(Auth.auth().currentUser?.uid)
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        self.userId = userId
        print("USER ID -> ", userId)
        fetchHistory()
    }
    
    /*
     
    */
    func fetchHistory() {
        // Prüfe nach ob ein User eingelogged ist. (guard let)
        guard let userId = userId else { return }
        // Es referenziert die Collection welche wir brauchen.
        let ref = db.collection("Users").document(userId).collection("watchHistory")
        // Der Listener holt sich die informationen die wie in der Referenzt angegegeben haben.
        let listener = ref.addSnapshotListener { [self] querySnapshot, error in
        // Wenn es einen Error gibt bei der Abfrage der Daten wird hier gestoppt und ein Print ausgegeben
            if let error = error {
                print("Snapshot error: \(error)")
                return
            }
            // Ich leere die Liste der videoHistory weil ich im nächsten Schritt was zur Liste hinzufüge, und damit keine alten Einträge entstehen wird die Liste geleert.
            videoHistory = []
            // Jetzt schauen wir uns jedes Element in den Dokomenten an.
            for document in querySnapshot!.documents {
                // Jetzt erstellen wir ein FirebaseVideo Model welches das Element aus dem Document enthält.
                let video = FirebaseVideo(data: document.data())
                // Wenn das Element nicht das gleiche ist, welches in der Liste schon vorhanden ist, dann fügen wir durch das append das Element hinzu.
                if !videoHistory.contains(where: { $0.id == video.id }) {
                    videoHistory.append(video)
                }
            }
            // Am Ende Sortieren wir die Liste der videoHistory durch das last Watched attribut. (Das Datum was am Aktuellsten ist, kommt nach ganz vorne!)
            videoHistory.sort(by: { $0.lastWatched >= $1.lastWatched } )
        }
    }
    
    func current_datetime() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        formatter.locale = Locale(identifier: "de_DE")
        return formatter.string(from: now)
    }
    
    func onWatchVideo(fbVideo: FirebaseVideo) { // -> onFavoriteButtonClick für Favoriten neues Feld DateAdded hinzufügen.
        var fbVideoNew = fbVideo
        fbVideoNew.lastWatched = current_datetime()
        saveVideoFirebase(video: fbVideoNew)
        
        fetchHistory()
        getFavorites()
    }
    
    func onFavoriteButtonClick(fbVideo: FirebaseVideo) { // -> onFavoriteButtonClick
        var fbVideoNew = fbVideo
        fbVideoNew.lastAdded = current_datetime()
        saveVideoToFavorites(video: fbVideoNew)
        
        fetchHistory()
        getFavorites()
    }
    
    
    
    func resetHistory() {
        guard let userId = userId else { return }
        let ref = db.collection("Users").document(userId).collection("watchHistory")

        ref.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            guard let snapshot = snapshot else {
                print("Snapshot is nil")
                return
            }

            for document in snapshot.documents {
                document.reference.delete()
            }

            self.videoHistory.removeAll()
            print("Array Items:", self.videoHistory)
        }
    }
    
    func deleteFavorites() {
        
        guard let userId = userId else { return }
        let ref = db.collection("Users").document(userId).collection("Favorites")

        ref.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            guard let snapshot = snapshot else {
                print("Snapshot is nil")
                return
            }

            for document in snapshot.documents {
                document.reference.delete()
            }

            self.favorites.removeAll()
            print("Array Items:", self.favorites)
        }
        
    }
    
    func getFavorites() {
            
            favorites = []
            
            let favoritesCollectionRef = db.collection("Users").document(userId ?? "Error UserId").collection("Favorites")
            
            favoritesCollectionRef.getDocuments { snapShot, error in
                
                if snapShot?.documents.count == 0 {
                    print("No Favorites detected")
                } else {
                    for document in snapShot!.documents {
                        
                        self.favorites.append(FirebaseVideo(data: document.data()))
                    }
                }
                self.favorites.sort(by: { $0.lastAdded >= $1.lastAdded } )
            }
        }
    
    func removeFavorite(videoID: String) {
        let favoritesCollectionRef = db.collection("Users").document(userId ?? "Error UserId").collection("Favorites")
        
        favoritesCollectionRef.getDocuments { snapshot, error in
            if let favorites = snapshot?.documents {
                for favorite in favorites {
                    if favorite.documentID == videoID {
                        favoritesCollectionRef.document(favorite.documentID).delete { error in
                            if let error = error {
                                print("Error deleting document: \(error)")
                            } else {
                                print("Favorite \(favorite.documentID) successfully deleted!")
                                self.favorites.removeAll(where: { $0.id == videoID } ) // In der Lokalen Variable wird dadurch das jeweilige Element gelöscht.
                            }
                        }
                    }
                }
            }
        }
    }
    
    func saveVideoToFavorites(video: FirebaseVideo) {
        
        db.collection("Users").document(userId ?? "Error UserId").collection("Favorites").document(video.id).setData([
            "id": video.id,
            "img": video.img,
            "title": video.title,
            "isFavorite": video.isFavorite,
            "lastWatched": video.lastWatched,
            "lastAdded":video.lastAdded]) { error in
            if let error = error {
                print("error writing \(error)")
                return
            } else {
                print("written")
            }
        }
    }
    
    
    func saveVideoFirebase(video: FirebaseVideo) { // TODO: Funktion muss noch gemacht werden um das Video zu erstellen, es müssen die Sachen aus der API herausgenommen werden und es muss nach der richtigen Rheinfolge erstellt werden.
        
        db.collection("Users").document(userId ?? "Error UserId").collection("watchHistory").document(video.id).setData([
            "id": video.id,
            "img": video.img,
            "title": video.title,
            "isFavorite": video.isFavorite,
            "lastWatched": video.lastWatched,
            "lastAdded":video.lastAdded]) { error in
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
                
                strongSelf.db.collection("watchHistory").document() // Wir möchten ein weiteres Document erstellen wo die letzten Suchergebnisse beinhaltet. In dem Document müssen alle Attribute sein die ein Video Suchergebnis hat: "VideoID","Thumbnail","Titel","Favorit"
                
                let docRef = strongSelf.db.collection("Users").document(authResult?.user.uid ?? "No ID")
                
                let datas = ["email" : authResult?.user.email, "uid": authResult?.user.uid, "displayName": authResult?.user.displayName]
                
                docRef.setData(datas)
                self!.accAccepted = true
                self!.accExist = false
//                self!.isLoggedIn = true
//                self!.userId = authResult!.user.uid                
            }
            else {
                if let errorCode = (error as NSError?)?.code {
                    if errorCode == AuthErrorCode.emailAlreadyInUse.rawValue {
                        // Account bereits vorhanden
                        self!.accExist = true
                    }
                } else{
                    print ("Error...")
                }
                
            }
        }
    }
    
    func login() {
        print("Speichert...")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                self.showError = true
                print("Login fehlgeschlagen: \(error.localizedDescription)")
                
            } else {
                print("Login successfully as: \(authResult!.user.email!)")
                self.isLoggedIn = true
                self.userId = authResult!.user.uid
                fetchHistory()
            }
        }
    }
    
    func logout() {
        
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            videoHistory = []
        } catch let signOutError as NSError {
            print("Fehler beim ausloggen: %@", signOutError)
        }
    }
    
    func checkUser() {
        if Auth.auth().currentUser != nil {
            isLoggedIn = true
            self.userId = Auth.auth().currentUser?.uid
            fetchHistory()
        } else {
            isLoggedIn = false
            self.userId = nil
        }
            print("UserID ??", userId)
    }
    
    func toggleFavoriteStatus(for firebaseVideo: FirebaseVideo) {
        guard let userId = userId else {
            return
        }
        
        let docRef = db.collection("Users").document(userId).collection("watchHistory").document(firebaseVideo.id)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let isFavorite = document.data()?["isFavorite"] as? Bool ?? false
                docRef.updateData(["isFavorite": !isFavorite])
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func getUserEmail() -> String {
        return Auth.auth().currentUser?.email ?? ""
       }
}


