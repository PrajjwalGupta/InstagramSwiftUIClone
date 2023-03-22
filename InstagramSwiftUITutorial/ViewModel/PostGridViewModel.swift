//
//  PostGridViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 02/05/22.
//

import SwiftUI

enum PostGridConfig {
    case search
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfig
    
    init(config: PostGridConfig) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    func fetchPosts(forConfig config: PostGridConfig){
        switch config {
        case .search:
            fetchSearchPagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
 
    }
    func fetchSearchPagePosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    func fetchUserPosts(forUid uid: String){
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        }
    }
}
