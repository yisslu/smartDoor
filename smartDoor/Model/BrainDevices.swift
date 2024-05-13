//
//  BrainDevices.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import Foundation

struct BrainDevices: Identifiable{
    let id = UUID()
    var devices = [
//        Devices(name:"Spotlight street",image:"bulb",type:.spotlight),
        Devices(name:"Room lock",image:"lockDoor",type:.lock, stat: false),
        Devices(name:"Street Door",image:"door",type:.door, stat: false)
//        Devices(name:"Terrace Camera",image:"camera",type:.camera)
    ]
}
