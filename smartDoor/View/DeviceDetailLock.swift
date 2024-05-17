//
//  DeviceDetail.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct DeviceDetailLock: View {
    var brain: Devices
    @EnvironmentObject var managerMqtt: MQTTManager
    @Binding var logoLocked: String
    @Binding var labelStatus: String
    var body: some View {
        ScrollView{
            ZStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(brain.nameDevice)
                            .font(.title)
                            .bold()
                        Text(brain.typeDevice.rawValue)
                            .font(.subheadline)
                    }
                    .offset(y:-70)
                    Image(brain.imageDevice)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                }
                .offset(y:-30)
                
                VStack(spacing: 10){
                    Text(labelStatus)
                        .bold()
                    Button{
                        if  !brain.status{
                            managerMqtt.authentication()
                            logoLocked = "lock.open.fill"
                            labelStatus = "Abierto"
                            brain.status = true
                            print(managerMqtt.$message)
                            
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
                                .foregroundStyle(.gray)
                            Circle()
                                .stroke(Color.gray, lineWidth: 10)
                                .frame(width: 150, height: 200)
                                .shadow(radius: 10)
                        }
                    }
                    
                    HStack{
                        Button("Agregar tarjeta"){
                            managerMqtt.addRemoveCard(isAdd: true)
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Remover tarjeta"){
                            managerMqtt.addRemoveCard(isAdd: false)
                        }
                        .buttonStyle(.bordered)
                    }
                    .tint(.green)
                }
                .offset(y:240)
                .background{
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.3)
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .frame(width: 380,height: 320,alignment: .top)
                        .offset(y:250)
                }
            }
            .padding()
        }
    }
}

#Preview {
    let logoStatus = Binding.constant("lock.fill")
    let labelStatus = Binding.constant("Cerrado")
    return DeviceDetailLock(brain: Devices(name:"Room lock",image:"lockDoor",type:.lock, stat: false), logoLocked: logoStatus, labelStatus: labelStatus)
        .environmentObject(MQTTManager())
}
