//
//  DeviceDetail.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct DeviceDetail: View {
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
                    .frame(width: 300, height: 300, alignment: .center)
            }
            .offset(y:-150)
            VStack{
                Button("Unlock"){
                    
                }
                .tint(.blue)
                .buttonStyle(.bordered)
                .offset(y:100)
            }
        }
    }
}

#Preview {
    DeviceDetail(nameDev: "My Lock", typeDev: .lock, imageDev: "lockDoor")
}
