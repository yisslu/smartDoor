//
//  BrainDevices.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import Foundation
import CocoaMQTT
import LocalAuthentication

struct BrainDevices: Identifiable{
    
    let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "192.168.1.8", port: 1883)
    
    let id = UUID()
    var devices = [
        Devices(name:"Spotlight street",image:"bulb",type:.spotlight),
        Devices(name:"Room lock",image:"lockDoor",type:.lock),
        Devices(name:"Street Door",image:"door",type:.door),
        Devices(name:"Terrace Camera",image:"camera",type:.camera)
    ]
    
    func connectMQTTServer(typeD: Devices.Types){
        mqttClient.connect()
        switch typeD {
        case .lock:
            authentication()
        default:
            print("Error")
        }
    }
    
    private func authentication(){
        var error: NSError?
        let laContext = LAContext()
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to open the door"){authenticate, error in
                if authenticate{
                    mqttClient.publish("rpi/gpio", withString: "accepted")
                }
            }
        }else{
            mqttClient.publish("rpi/gpio", withString: "refused")
        }
    }
}
