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
                    publishValueForType(type: messages.send.verifiedFID)
                }
            }
        }else{
            publishValueForType(type: messages.send.deniedFID)
        }
    }
    
    func addRemoveCard(isAdd: Bool){
        if isAdd{
            publishValueForType(type: messages.send.add)
        }else{
            publishValueForType(type: messages.send.remove)
        }
    }
    
    func publishValueForType(type: String) {
            let jsonDict = ["type": type]
            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonDict),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                mqttClient.publish("rpi/gpio", withString: jsonString)
            }
        }
}
