//
//  MainPageViewModel.swift
//  WeatherApp
//
//  Created by LAP15789 on 17/05/2023.
//

import Foundation


protocol MainPageViewModelType: ObservableObject {
    var weatherInfos:[WeatherInfo] {get}
    
    func getWeatherInfos()
}

class MainPageViewModel:MainPageViewModelType{
    @Published var weatherInfos: [WeatherInfo] = [WeatherInfo]()
    
    func getWeatherInfos() {
        ApiService().loadData { [weak self](list) in
            self?.weatherInfos = list ?? [WeatherInfo]()
        }
    }
    
    
}
