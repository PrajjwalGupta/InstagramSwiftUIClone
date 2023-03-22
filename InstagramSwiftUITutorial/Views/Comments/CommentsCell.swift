//
//  CommentsCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 02/05/22.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment : Comment
    
    var body: some View {
        HStack() {
            
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
            Text(" \(comment.commentText)").font(.system(size: 14, weight: .light))
            
            Spacer()
            
            Text(" \(comment.timestampString ?? "")")
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.gray)
                
        }.padding(.horizontal)
    }
}

