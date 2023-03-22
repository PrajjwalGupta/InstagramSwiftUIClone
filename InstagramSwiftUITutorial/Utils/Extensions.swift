//
//  Extensions.swift
//  InstagramSwiftUITutorial
//
//  Created by Prajjawal Gupta on 08/04/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
