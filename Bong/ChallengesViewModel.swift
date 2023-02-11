//
//  FirestoreManager.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//
import FirebaseFirestore
import Foundation

struct Challenge: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  var user: String
  var time: Int
}


class ChallengesViewModel: ObservableObject {
  @Published var challenges = [Challenge]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    db.collection("challenges").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.challenges = documents.map { queryDocumentSnapshot -> Challenge in
        let data = queryDocumentSnapshot.data()
        let title = data["title"] as? String ?? ""
        let user = data["user"] as? String ?? ""
        let time = data["time"] as? Int ?? 0

        return Challenge(id: .init(), title: title, user: user, time: time)
      }
    }
  }
}
