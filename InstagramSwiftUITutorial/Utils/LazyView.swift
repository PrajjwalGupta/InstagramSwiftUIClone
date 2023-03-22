//
//  LazyView.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 05/05/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content ) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
    
}
