//
//  UIViewControllerRepresentable.swift
//  WeatherApp
//
//  Created by LAP15789 on 18/05/2023.
//

import UIKit
import SwiftUI



struct WeatherDetailView: UIViewControllerRepresentable {
    typealias UIViewControllerType = WeatherDetailViewController

    func makeUIViewController(context: Context) -> WeatherDetailViewController {
      return WeatherDetailViewController()
    }
    
    func updateUIViewController(_ uiViewController: WeatherDetailViewController, context: Context) {
      
    }


}
