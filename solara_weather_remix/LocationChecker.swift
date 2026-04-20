//
//  LocationChecker.swift
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

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isChecked: Bool = false
}

struct LocationChecker: View {
    @State var uvCircle: Double = 0.60
    @State private var tasks = [Task(name: "Sunscreen", isChecked: false), Task(name: "Umbrella", isChecked: false), Task(name: "Sunglasses", isChecked: false), Task(name: "Hat", isChecked: false)]
    
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
                VStack {
                    Text("Kuta")
                        .font(Font.largeTitle.bold())
                    Text("31°C")
                        .font(Font.largeTitle)
                }
                .padding()
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: uvCircle)
                        .stroke(.red, style: StrokeStyle(
                            lineWidth: 18, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200, height: 200)
                        .animation(.easeOut, value: uvCircle)
                    VStack {
                        Text("6")
                            .font(Font.largeTitle.bold())
                        Text("15:00-17:00")
                    }
                    
                }
                .padding()
                
                VStack {
                    Text("Recommended Protections:")
                    List($tasks) { $task in
                        HStack {
                            Text(task.name)
                            Spacer()
                            Image(systemName: task.isChecked ? "checkmark.square" :"square")
                                .onTapGesture {
                                    task.isChecked.toggle()
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LocationChecker()
}
