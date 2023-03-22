//
//  ProfileHeaderView.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 08/04/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                KFImage(URL(string: viewModel.user.ProfileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                HStack(spacing: 16){
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }.padding(.trailing)
            }
            Text(viewModel.user.Fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            HStack {
                Spacer()
                ProfileActionViewButton(viewModel: viewModel)
                Spacer()
            }.padding(.top)
        }
    }
}

