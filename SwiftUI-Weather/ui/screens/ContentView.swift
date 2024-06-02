//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kirill Bereznev on 3/6/24.
//

import SwiftUI


struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayWeek: "TUE", imageName: "cloud.sun.fill", temp: 74)
                    WeatherDayView(dayWeek: "WED", imageName: "sun.max.fill", temp: 88)
                    WeatherDayView(dayWeek: "THU", imageName: "wind.snow", temp: 55)
                    WeatherDayView(dayWeek: "FRI", imageName: "sunset.fill", temp: 60)
                    WeatherDayView(dayWeek: "SAT", imageName: "snow", temp: 25)
                    
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                    
                } label: {
                    WeatherButton(title: "Change Day Time",textColor: .white, backgroundColor: .blue)
                }
                
                Spacer()
            }
        }
    }
    
}


struct WeatherDayView: View {
    var dayWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temp)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
   @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding(.bottom)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: Int

    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,  40)
    }
}

#Preview {
    ContentView()
}
