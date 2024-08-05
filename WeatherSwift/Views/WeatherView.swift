//
//  WeatherView.swift
//  WeatherSwift
//
//  Created by Luciano dii Souza on 04/08/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(.title)
                    
                    Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                            .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        LoadingView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now").bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: weather.main.tempMin.roundDouble() + "º")
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: weather.main.tempMax.roundDouble() + "º")
                        Spacer()
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                        Spacer()
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.765, saturation: 0.948, brightness: 0.544))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.765, saturation: 0.948, brightness: 0.544))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
