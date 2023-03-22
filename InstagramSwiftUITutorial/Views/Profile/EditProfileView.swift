//
//  EditProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 05/05/22.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @Environment(\.presentationMode) var mode
    @Binding var user: User
    @ObservedObject private var viewModel: EditProfileViewModel
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { mode.wrappedValue.dismiss()}, label: {
                    Text("Cancel")
                })
                Spacer()
                Button(action: { viewModel.saveUserBio(bioText) }, label: {
                    Text("Done").bold()
                })
            }.padding()
            TextArea(text: $bioText, placeholder: "Add your Bio...")
                .frame(width: 340, height: 200)
                .padding()
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
       
}

