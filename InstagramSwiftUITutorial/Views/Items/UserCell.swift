//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 07/04/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            KFImage(URL(string: user.ProfileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text (user.Username)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.trailing)
                
                Text(user.Fullname)
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}
