//
//  MqttCall.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 09/05/24.
//

import Foundation
import CocoaMQTT
import LocalAuthentication

let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "Jesuss-MacBook-Air.local", port: 1883)

class MQTTManager:ObservableObject{
    var messageType = ""
    
    init() {
        mqttClient.subscribe("rpi/gpio", qos: CocoaMQTTQoS.qos1)
        mqttClient.didReceiveMessage = { mqtt, message, id in
            let jsonData = Data(message.payload)
            do {
                // Decode the JSON data into the Message struct
                let decodedObject = try JSONDecoder().decode(Message.self, from: jsonData)
                self.messageType = decodedObject.type
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }
    }
    
    func authentication(completion: @escaping (String) -> Void) {
        let laContext = LAContext()
        var error: NSError?
        
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to open the door") { success, error in
                if success {
                    self.publishValueForType(type: "verifiedFID")
                } else {
                    self.publishValueForType(type: "deniedFID")
                }
                // Using a delay to simulate waiting for the messageType to update
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                    completion(self.messageType)
                }
            }
        } else {
            completion("Biometrics not available")
        }
    }
    
    func addRemoveCard(isAdd: Bool, completion: @escaping (String) -> Void) {
        if isAdd {
            publishValueForType(type: "add")
        } else {
            publishValueForType(type: "remove")
        }
        // Using a delay to simulate waiting for the messageType to update
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            completion(self.messageType)
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

struct Message: Decodable {
    let type: String
}
