//
//  locationchecker.swift
//  solara_weather_remix
//
//  Created by Annisa Rahmadani on 20/04/26.
//

import SwiftUI

struct locationcheckerTry {
    var location : String
    var temperature : Int
    var uvIndex : Int
    var startTime : String
    var endTime : String
    var recommendation : String
}

struct locationchecker: View {
    var body: some View {
        ZStack {
            
            //background
            
            LinearGradient(colors: [.white, .yellow],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.backward")
                            .padding(10)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .cornerRadius(.infinity)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .padding(10)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .cornerRadius(.infinity)
                    }
                }
            }
        }
    }
}

#Preview {
    locationchecker()
}
