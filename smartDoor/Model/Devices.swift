//
//  Devices.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import Foundation


class Devices: Identifiable{
    var id = UUID()
    
    var nameDevice: String
    var imageDevice: String
    var typeDevice: Types
    var status: Bool
    
    init (name: String, image: String, type: Types, stat: Bool){
        nameDevice = name
        imageDevice = image
        typeDevice = type
        status = stat
    }
}

enum Types: String{
    case lock = "Lock"
    case camera = "Camera"
    case door = "Door"
    case spotlight = "Spotlight"
}
