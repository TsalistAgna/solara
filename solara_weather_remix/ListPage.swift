//
//  List.swift
//  solara_weather_remix
// 
//  Created by Annisa Rahmadani on 19/04/26.
//

import SwiftUI

struct ListTry {
    var location : String
    var temperature : Int
    var uvIndex : Int
    var startTime : String
    var endTime : String
}

struct List: View {
    var uvLocationData : [ListTry] = [
        ListTry(location: "Canggu", temperature: 32, uvIndex: 7, startTime: "10:00", endTime: "12:15"),
        ListTry(location: "Gianyar", temperature: 27, uvIndex: 4, startTime: "15:10", endTime: "16:10"),
        ListTry(location: "Kuta", temperature: 25, uvIndex: 2, startTime: "17:30", endTime: "19:25")    ]
    
    var body: some View {
        ZStack {
            
            //background
            
            LinearGradient(colors: [.white, .yellow],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("List of Places")
                        .font(Font.largeTitle.bold())
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .padding(10)
                            .foregroundColor(Color.black)
                            .cornerRadius(.infinity)
                    }
                }
                ForEach(uvLocationData, id: \.location) {
                    uvData in
                    HStack {
                        VStack {
                            Text(uvData.location)
                                .fontWeight(.bold)
                            Text("\(uvData.temperature)º")
                                .font(.largeTitle)
                            Text("\(uvData.startTime)" + "-" + "\(uvData.endTime)")
                        }
                        Spacer()
                        VStack {
                            Text("\(uvData.uvIndex)")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundStyle(Color.white)
                                 Text("UV Index")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundStyle(Color.white)
                        }
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding()
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                }
                    }
                }
        .padding()
        }
}

#Preview {
    List()
}
