//
//  SearchBar.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 07/04/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .onTapGesture {
                    isEditing = true
                    text = ""
                    UIApplication.shared.endEditing()
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                })
                    .padding(.trailing, 8)
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut, value: isEditing)
            }
            
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
