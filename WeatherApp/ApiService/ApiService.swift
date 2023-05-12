//
//  ApiService.swift
//  WeatherApp
//
//  Created by LAP15789 on 12/05/2023.
//

import Foundation

class ApiService : ObservableObject{
    //    @Published var books = [Book]()
    @Published var count :Int = 0
    let link = "https://api.openweathermap.org/data/2.5/forecast/daily?&cnt=7&appid=60c6fbeb4b93ac653c492ba806fc346d&q=hanoi"
    
    
    func loadData(completion:@escaping ([WeatherInfo]?) -> ()) {
        guard let url = URL(string: link) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let response = try! JSONDecoder().decode(WeatherInfoResponse.self, from: data!)
            print(response)
            DispatchQueue.main.async {
                completion(response.list)
            }
        }.resume()
        
    }
}
