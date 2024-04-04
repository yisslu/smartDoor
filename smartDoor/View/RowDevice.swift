//
//  RowDevice.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct RowDevice: View {
    var oneRow = BrainDevices()
    var body: some View {
        ScrollView{
            VStack(){
                ForEach(oneRow.devices){
                    device in
                    NavigationLink{
                        DeviceDetail(nameDev: device.nameDevice, typeDev: device.typeDevice, imageDev: device.imageDevice)
                    }label:{
                        itemView(oneDevice: device)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    RowDevice()
}
