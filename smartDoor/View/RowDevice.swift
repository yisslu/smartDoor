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
        NavigationView{
            ScrollView{
                VStack(){
                    ForEach(oneRow.devices){
                        device in
                        NavigationLink{ DeviceDetail(nameDev: device.nameDevice, typeDev: device.typeDevice, imageDev: device.imageDevice)}label:{
                            itemView(oneDevice: device)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("My devices")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RowDevice()
}
