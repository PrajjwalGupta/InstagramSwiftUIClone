//
//  Notifications.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 03/05/22.
//

import SwiftUI
import Firebase
 
class NotificationViewModel: ObservableObject{
    @Published var notification = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let query  = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else {return}
            self.notification = documents.compactMap({ try? $0.data(as: Notification.self) })
            print("DEBUG: notifcation .... \(self.notification)")
        }
        
    }
    static func uploadNotifications(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.id else {return}
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.Username,
                                   "uid": user.id ?? "",
                                   "profileImageUrl": user.ProfileImageUrl,
                                   "type": type.rawValue]
        
        if let post = post, let id = post.id {
            data["postId"] =  id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
