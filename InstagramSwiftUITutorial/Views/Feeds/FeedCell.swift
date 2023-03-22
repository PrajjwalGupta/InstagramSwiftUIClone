//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 07/04/22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    
    @ObservedObject var viewModel: FeedCellViewModel
    
   
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
        
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                NavigationLink(destination: Text("Post")) {
                    KFImage(URL(string: viewModel.post.ownerImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                        .padding(.leading)
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 14, weight: .semibold))
                }
             }
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 440)
                .clipped()
            HStack(spacing: 16) {
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .gray)
                        .frame(width: 20, height: 20)
                        .padding(4)
                })
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .padding(4)
                })
               NavigationLink(destination: {
                    CommentsView(post: viewModel.post)
                }, label: {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .padding(4)
                })
            }
            .padding(.leading, 4)
            .foregroundColor(.secondary)
            
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) +
                Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
               // .multilineTextAlignment(.leading)
            } .padding(.horizontal, 8)
            Text(viewModel.timastampString)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
        .padding(.bottom)
    }
}

