//
//  DeviceDetail.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct DeviceDetail: View {
    let brain = BrainDevices()
    var nameDev: String
    var typeDev: Devices.Types
    var imageDev: String
    var body: some View {
        ZStack{
            VStack{
                Text(nameDev)
                    .font(.title)
                Text(typeDev.rawValue)
                    .font(.subheadline)
                Image(imageDev)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
            }
            .offset(y:-150)
            .background{
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 400,height: 1000,alignment: .top)
            }
            HStack(spacing: 70){
                Button("Unlock"){
                    brain.connectMQTTServer(typeD: typeDev)
                }
                .tint(.green)
                .buttonStyle(.bordered)
                .controlSize(.large)
                .offset(y:270)
                .shadow(radius: 10)
                
                Button("Lock"){
                    brain.connectMQTTServer(typeD: typeDev)
                }
                .tint(.green)
                .buttonStyle(.bordered)
                .controlSize(.large)
                .offset(y:270)
                .shadow(radius: 10)
            }
            .background{
                Rectangle()
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                    .frame(width: 400,height: 450,alignment: .top)
                    .offset(y:250)
            }
        }
    }
}

#Preview {
    DeviceDetail(nameDev: "My Lock", typeDev: .lock, imageDev: "lockDoor")
}
