//
//  HomePage.swift
//  solara_weather_remix
//
//  Created by Baiq Annisa Tsalist Agna on 19/04/26.
//

import SwiftUI

struct Weather{
    var temperature: Int
    var uvIndex: Int
    var humidity: Int
    var location: String
    var date: String
}

var weather = Weather(temperature: 32, uvIndex: 4, humidity: 65, location: "Badung, Bali", date: "August 10, 2026")

//sheet
struct ReminderSheet: View{
    @Binding var reminderTime: Date
    @Binding var isReminderSet: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack{
            HStack{
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 24))
                        .padding(10)
                        .background(Circle().fill(.gray.opacity(0.2)))
                }
                
                Spacer()
                
                Text("Add Reminder")
                    .font(.system(size: 20, weight: .medium))
                
                Spacer()
                
                Button{
                    isReminderSet = true
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .font(.system(size: 24))
                        .padding(10)
                        .background(Circle().fill(Color.gray.opacity(0.2)))
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            DatePicker("", selection:$reminderTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
        }
    }
}

struct ReminderCard: View {
    var reminderTime: Date
    @State private var now = Date()
    
    var body: some View{
        VStack(spacing: 8){
            Text("Reapply SPF in")
                .font(.system(size: 17, weight: .medium))
            Text(timeRemaining)
                .font(.system(size: 60, weight: .medium))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
                _ in now = Date()
            }
        }
    }
    
    var timeRemaining: String{
        let diff = Int(reminderTime.timeIntervalSince(now))
        if diff <= 0 {
            return "Reapply now!"
        }
        let minute = diff / 60
        let seconds = diff % 60
        
        return String(format: "%02d:%02d", minute, seconds)
    }
}


struct HomePage: View {
    @State private var showSheet = false
    @State private var reminderTime: Date = Date()
    @State private var isReminderSet = false
    
    var body: some View {
        //background
        ZStack(alignment: .top){
            if weather.temperature >= 29{
                LinearGradient(
                        colors: [
                            Color(red: 1.0, green: 1.0, blue: 0.95),
                            Color(red: 1.0, green: 0.89, blue: 0.58)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
            }else{
                LinearGradient(
                        colors: [
                            Color(red: 1.0, green: 1.0, blue: 1.0),
                            Color(red: 0.576, green: 0.847, blue: 1.0)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
            }
            
            
            ScrollView {
                //top element
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Hi, how you doing today?").font(.system(size: 20)).padding(.bottom, 4)
                            Text(weather.date).font(.system(size: 17)).opacity(0.7)
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Button(action: {
                                print("Search tapped")
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.yellow)
                                    .padding(12)
                                    .background(Circle().fill(.white))
                            }
                        }
                    }
                    
                    //hero section
                    HStack (alignment: .center){
                        VStack(alignment: .leading){
                            Text("\(weather.temperature)" + "º").font(.system(size: 100, weight: .medium))
                            HStack(spacing: 6){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.system(size: 14))
                                
                                Text(weather.location)
                                    .font(.system(size: 16))
                            }
                        }
                        
                        Spacer() //give space between the stack
                        
                        VStack(alignment: .trailing){
                            Image("sunny")
                                .frame(width: 118, height: 118)
                        }
                        .padding(.trailing, 20)
                    }
                    
                    //uv index and humidity card
                    HStack{
                        VStack(spacing: 8){
                            Text("UV Index")
                                .font(.system(size: 14))
                                .opacity(0.7)
                            
                            switch weather.uvIndex {
                            case 0..<3:
                                Text("Low").font(.system(size: 20, weight: .medium))
                            case 3..<6:
                                Text("Moderate").font(.system(size: 20, weight: .medium))
                            case 6..<8:
                                Text("High").font(.system(size: 20, weight: .medium))
                            case 8..<11:
                                Text("Very High").font(.system(size: 20, weight: .medium))
                            default:
                                Text("Extreme").font(.system(size: 20, weight: .medium))
                            }
                            
                            Text("\(weather.uvIndex)")
                                .font(.system(size: 48, weight: .medium))
                            
                            Text("Peak UV Hour")
                                .font(.system(size: 12, weight: .light))
                            
                            HStack{
                                Image(systemName: "clock")
                                    .font(.system(size: 14))
                                Text("13:00")
                            }
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                        .foregroundStyle(Color(.black))
                        .background(Color.white)
                        .cornerRadius(24)
                        
                        Spacer()
                        
                        VStack(spacing: 8){
                            Text("Humidity Level")
                                .font(.system(size: 14))
                                .opacity(0.7)
                            
                            switch weather.humidity{
                            case 55..<60:
                                Text("Some").font(.system(size: 20, weight: .medium))
                            case 60..<65:
                                Text("Moderate").font(.system(size: 20, weight: .medium))
                            case 65..<70:
                                Text("High").font(.system(size: 20, weight: .medium))
                            case 70..<75:
                                Text("Very High").font(.system(size: 20, weight: .medium))
                            default:
                                Text("Extreme").font(.system(size: 20, weight: .medium))
                            }
                            
                            Text("\(weather.humidity)" + "%")
                                .font(.system(size: 48, weight: .medium))
                            
                            Text("The dew point is at")
                                .font(.system(size: 12, weight: .light))
                                .multilineTextAlignment(.center)
                            Text("24º right now")
                                .font(.system(size: 12, weight: .light))
                                .multilineTextAlignment(.center)
                            
                        }
                        .padding(.vertical, 23)
                        .padding(.horizontal, 40)
                        .foregroundStyle(Color(.black))
                        .background(Color.white)
                        .cornerRadius(24)
                    }
                    .padding(.top, 28)
                    .padding(.bottom, 2)
                    
                    if isReminderSet{
                        ReminderCard(reminderTime: reminderTime)
                    }
                    
                    //spf recs card
                    VStack(spacing: 8){
                        Text("SPF Reccomendation")
                            .font(.system(size: 17, weight: .medium))
                        
                        switch weather.uvIndex {
                        case 0..<3:
                            Text("15+").font(.system(size: 60, weight: .medium))
                        case 3..<6:
                            Text("30+").font(.system(size: 60, weight: .medium))
                        case 6..<8:
                            Text("30-50").font(.system(size: 60, weight: .medium))
                        case 8..<11:
                            Text("50+").font(.system(size: 20, weight: .medium))
                        default:
                            Text("50+").font(.system(size: 20, weight: .medium))
                        }
                        
                        Text("Reapply every 2 hours")
                            .font(.system(size: 12, weight: .light))
                        
                        Button(action: {
                            showSheet = true
                        }) {
                            HStack(spacing: 8){
                                Image(systemName: "alarm")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Set Reminder")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 1.0, green: 0.629, blue: 0.004))
                            .cornerRadius(16)
                        }
                        
                        .sheet(isPresented: $showSheet){
                            ReminderSheet(
                                reminderTime: $reminderTime,
                                isReminderSet: $isReminderSet
                            )
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                            .presentationCornerRadius(24)
                            
                        }
                    }
                    .padding(.vertical, 22)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(.black))
                    .background(Color.white)
                    .cornerRadius(24)
                    
                }.padding(20)
            } //padding accross the pages on all elements

        }
        
    }
}

#Preview {
    HomePage()
}
