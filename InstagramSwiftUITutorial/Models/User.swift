//
//  User.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 29/04/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let Email: String
    let Username: String
    let Fullname: String
    let ProfileImageUrl: String
    let UID: String
    @DocumentID var id: String?
    var bio: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    
    
    var isCurrentUser: Bool {return AuthViewModel.shared.userSession?.uid == id}
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
    
}

