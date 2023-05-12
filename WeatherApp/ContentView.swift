//
//  ContentView.swift
//  WeatherApp
//
//  Created by LAP15789 on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var infos:[WeatherInfo] = [WeatherInfo]()
    
    
    var body: some View {
        List(infos, id: \.id) { info in
            let main = info.weather?.first?.main ?? ""
            Text("\(main)")
        }
        .onAppear() {
            ApiService().loadData { (list) in
                self.infos = list!
            }
        }.navigationTitle("Weather List")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
