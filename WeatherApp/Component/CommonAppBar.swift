//
//  CommonAppBar.swift
//  WeatherApp
//
//  Created by LAP15789 on 16/05/2023.
//

import Foundation
import SwiftUI

extension View {
/// CommonAppBar
public func appBar(title: String, backButtonAction: @escaping() -> Void) -> some View {
    
    self
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            backButtonAction()
        }) {
            Image("ic-back") // set backbutton image here
                .renderingMode(.template)
                .foregroundColor(.green)
        })
    }
}
