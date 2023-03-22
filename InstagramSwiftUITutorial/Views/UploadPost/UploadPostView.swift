//
//  UploadPostView.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 07/04/22.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {imagePickerPresented.toggle()}, label: {
                    Image(systemName: "plus.circle")
                        
                        .resizable()
                        .renderingMode(.template)
                        .font(.system(size: 30, weight: .thin))
                        .opacity(0.5)
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                        
                    
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                        .padding(.trailing)
                    
                   // TextField("Enter Your Caption..", text: $captionText)
                    TextArea(text: $captionText, placeholder: "Enter your text...")
                        .frame(height: 200)
                        
                }.padding()
                HStack(spacing: 14) {
                    Button(action: {
                        if let image = selectedImage {
                            viewModel.UploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    }, label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 42, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    })
                    Button(action: {
                        captionText = ""
                        postImage = nil
                    }, label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 42, alignment: .center)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    })
                }
                
                
            }
                Spacer()
        }
    }
}


extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
