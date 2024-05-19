//
//  smartDoorApp.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import SwiftUI
import CocoaMQTT

@main
struct smartDoorApp: App {
    init(){
        mqttClient.connect()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

