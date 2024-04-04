//
//  Devices.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import Foundation


struct Devices: Identifiable{
    var id = UUID()
    
    var nameDevice: String
    var imageDevice: String
    var typeDevice: Types
    
    init (name: String, image: String, type: Types){
        nameDevice = name
        imageDevice = image
        typeDevice = type
    }
    
    enum Types: String{
        case lock = "Lock"
        case camera = "Camera"
        case door = "Door"
        case spotlight = "Spotlight"
    }
}
