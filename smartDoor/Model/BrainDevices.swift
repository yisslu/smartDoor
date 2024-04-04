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
        Devices(name:"My door",image:"lockDoor",type:.door),
        Devices(name:"My lock",image:"lockDoor",type:.lock),
        Devices(name:"My door 2",image:"lockDoor",type:.door),
        Devices(name:"My lock 2",image:"lockDoor",type:.lock)
    ]
}
