//
//  MqttCall.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 09/05/24.
//

import Foundation
import CocoaMQTT
import LocalAuthentication

let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "raspberry.local", port: 1883)

struct MQTTManager{
    
    var messages : JsonManager = load("messageType.json")
    func authentication(){
        var error: NSError?
        let laContext = LAContext()
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to open the door"){authenticate, error in
                if authenticate{
                    mqttClient.publish("rpi/gpio", withString: messages.send.verifiedFID)
                }
            }
        }else{
            mqttClient.publish("rpi/gpio", withString: messages.send.deniedFID)
        }
    }
    
    func addRemoveCard(isAdd: Bool){
        if isAdd{
            mqttClient.publish("rpi/gpio",withString: messages.send.add)
        }else{
            mqttClient.publish("rpi/gpio", withString: messages.send.remove)
        }
    }
}
