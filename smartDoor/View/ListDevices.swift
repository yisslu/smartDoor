//
//  RowDevice.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct ListDevices: View {
    var oneRow = BrainDevices()
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(){
                    ForEach(oneRow.devices){
                        device in
                        NavigationLink{ DeviceDetail(nameDev: device.nameDevice, typeDev: device.typeDevice, imageDev: device.imageDevice)}label:{
                            DeviceView(oneDevice: device)
                        }
                    }
                }
                .padding()
            }
            .accentColor(.green)
            .navigationTitle("My devices")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarBackground(Color.white, for: .navigationBar)
            .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(height:900)
                .ignoresSafeArea()
                .offset(x:-210))
        }
    }
}

#Preview {
    ListDevices()
}
