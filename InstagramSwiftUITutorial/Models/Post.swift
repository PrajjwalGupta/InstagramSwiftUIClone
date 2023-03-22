//
//  Post.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 02/05/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    var likes: Int
    let caption: String
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
}
