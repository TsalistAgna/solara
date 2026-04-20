//
//  ContentView.swift
//  solara_weather_remix
//
//  Created by Baiq Annisa Tsalist Agna on 19/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomePage()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            
            ListPage()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
        }
        .tint(Color(red: 1.0, green: 0.729, blue: 0.004))
    }
}

#Preview {
    ContentView()
}
