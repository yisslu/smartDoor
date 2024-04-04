//
//  ContentView.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            RowDevice()                
                .tabItem{Image(systemName: "house")
                Text("Home")
            }
            ProfileUser()
                .tabItem{Image(systemName: "person")
                    Text("Profile")
                }
        }
        .tint(.green)
    }
}

#Preview {
    ContentView()
}
