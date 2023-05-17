//
//  ContentView.swift
//  WeatherApp
//
//  Created by LAP15789 on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var infos:[WeatherInfo] = [WeatherInfo]()
    @State var theme:Theme = LightTheme()
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing:5) {
                Text("Weather")
                    .frame(height:50)
                    .font(.system(size: 20))
                    .shadow(radius: 10)
                    .background(theme.screenColor)
                
                ScrollView(.vertical) {
                    ForEach(infos, id: \.id) { info in
                        generateListItem(item: info,screenWidth:geo.size.width)
                        Spacer().frame(height:20)
                    }
                    .onAppear() {
                        ApiService().loadData { (list) in
                            self.infos = list!
                        }
                    }
                }
            }
            .background(theme.screenColor)
        }
    }
    
    func generateListItem(item: WeatherInfo,screenWidth:CGFloat) -> some View {
        print("xxx",item)
        return ZStack {
            HStack {
                VStack(alignment:.leading){
                    PlaceLabel(currentTheme: theme)
                    InfoRow(currentTheme: theme,info: item)
                }
                .frame(alignment: .topLeading)
                .layoutPriority(1)
                
                
                Divider()
                    .frame(width:2)
                    .background(.white)
                
                NextDay(currentTheme: theme)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(10)
            .background(theme.backgroundColor)
            .cornerRadius(15)
            .shadow(radius: 7)
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlaceLabel: View {
    var currentTheme:Theme
    
    var body: some View {
        HStack() {
            Image("ic_location")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 16, height: 16)
            
            Text("Hanoi")
                .foregroundColor(currentTheme.textColor)
                .font(.custom("Pacifico-Regular", size: 14))
            
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
        .background(.blue)
        .cornerRadius(10)
    }
}

struct InfoRow: View {
    var currentTheme:Theme
    var info:WeatherInfo
    
    func getMaxTemp()->String{
        guard let maxTemp = info.temp?.max, info.temp?.max != nil else {
                    return ""
                }
        let celTemp = Int(maxTemp) - 273
        return String(celTemp)
    }
    
    
    var body: some View {

        HStack(alignment:.bottom){
            VStack(spacing:7){
                Image("ic_sun")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                
                                
                Text( info.weather?.first?.main ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(currentTheme.textColor)
            }
            .padding(5)
            VStack(spacing:7){
                Text(getMaxTemp())
                    .font(.system(size: 33.5))
                    .foregroundColor(currentTheme.textColor)
                Text("Sunny")
                    .font(.system(size: 16))
                    .foregroundColor(currentTheme.textColor)
            }
            .padding(5)
            
            VStack(spacing:13){
                Text("26 Good")
                    .font(.system(size: 16))
                    .foregroundColor(currentTheme.textColor)
                    .padding(EdgeInsets(top:2,leading:5,bottom:2,trailing: 5))
                    .background(.green)
                    .cornerRadius(14)
                
                Text("S 1.3mph")
                    .font(.system(size: 16))
                    .foregroundColor(currentTheme.textColor)
            }
            .padding(5)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
    }
}

struct NextDay: View {
    var currentTheme:Theme

    var body: some View {
        VStack{
            HStack{
                Text("Mon")
                    .font(.system(size: 14))
                    .foregroundColor(currentTheme.textColor)
                
                Spacer()
                HStack {
                    Text("More")
                        .font(.system(size: 14))
                        .foregroundColor(currentTheme.textColor)
                    
                    Image(systemName: "arrow.right")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                    
                }
            }
            .padding(EdgeInsets(top:0,leading: 3,bottom: 0,trailing: 3))
            
            VStack(spacing:7){
                Image("ic_cloud")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                
                Text("10/17")
                    .font(.system(size: 16))
                    .foregroundColor(currentTheme.textColor)
            }
            .padding(EdgeInsets(top:15,leading: 0,bottom: 0,trailing: 0))
        }
    }
}
