//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by LAP15789 on 12/05/2023.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            MainPage(viewModel:MainPageViewModel())
        }
    }
}
