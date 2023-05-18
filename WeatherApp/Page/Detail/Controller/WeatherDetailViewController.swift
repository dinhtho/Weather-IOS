//
//  WeatherDetailControllerViewController.swift
//  WeatherApp
//
//  Created by LAP15789 on 18/05/2023.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Hello, UIKit!"
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        // 3
        view.addSubview(label)
    }
    
    
    
}
