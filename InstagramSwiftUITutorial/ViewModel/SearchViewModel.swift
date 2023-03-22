//
//  SearchViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 29/04/22.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    //@Published var posts = [Post]()
    
    init() {
        fetchUser()
        
    }
    
    func fetchUser() {
        COLLECTION_USERS.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({try? $0.data(as: User.self)})
            
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.Fullname.lowercased().contains(lowercasedQuery) || $0.Username.contains(lowercasedQuery) })
    }
    
//    func fetchPosts() {
//        COLLECTION_POSTS.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
//        }
//    }
}
