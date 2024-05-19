//
//  DeviceDetailDoor.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct DeviceDetailDoor: View {
    var brain: Devices
    let managerMqtt = MQTTManager()
    @Binding var logoLocked: String
    @Binding var labelStatus: String
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(brain.nameDevice)
                            .font(.title)
                            .bold()
                        Text(brain.typeDevice.rawValue)
                            .font(.subheadline)
                    }
                    .foregroundStyle(Color(hex: "5E69EE"))
                    Spacer()
                    Image(brain.imageDevice)
                        .resizable()
                        .frame(width: 85, height: 100, alignment: .center)
                        .offset(y:70)
                }
                .padding()
                
                VStack {
                    Text(labelStatus)
                        .bold()
                        .foregroundStyle(.white)
                    Button{
                        if  !brain.status{
                            logoLocked = "lock.open.fill"
                            labelStatus = "Abierto"
                            brain.status = true
                            
                        }else{
                            logoLocked = "lock.fill"
                            labelStatus = "Cerrado"
                            brain.status = false
                        }
                        
                    }label: {
                        ZStack{
                            Image(systemName: logoLocked)
                                .resizable()
                                .frame(width: 45, height: 50)
                                .foregroundStyle(.white)
                            Circle()
                                .stroke(Color.white, lineWidth: 10)
                                .frame(width: 150, height: 200)
                                .shadow(radius: 10)
                        }
                       
                    }
                }
                .background{
                    Rectangle()
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .frame(width: 380,height: 320,alignment: .top)
                        .foregroundStyle(Color(hex: "5E69EE"))
                }
                .offset(y:100)
            }
            .padding()
        }
    }
}

#Preview {
    let logoStatus = Binding.constant("lock.fill")
    let labelStatus = Binding.constant("Cerrado")
    return DeviceDetailDoor(brain: Devices(name:"Room lock",image:"door",type:.lock, stat: false), logoLocked: logoStatus, labelStatus: labelStatus)
}
