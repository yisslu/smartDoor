//
//  ContentView.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
    UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView{
            
            ListDevices()
                .tabItem{Image(systemName: "house")
                Text("Home")
            }
            ProfileUser()
                .tabItem{Image(systemName: "person")
                    Text("Profile")
                }
                
        }
        .tint(Color(hex: "5E69EE"))
    }
}

#Preview {
    ContentView()
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
