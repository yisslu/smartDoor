//
//  itemView.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import SwiftUI

struct DeviceView: View {
    var oneDevice: Devices
    var body: some View {
        VStack(alignment: .leading){
            Text(oneDevice.nameDevice)
                .bold()
                .padding()
                .frame(maxWidth:.infinity,alignment: .leading)
            
            HStack{
                Text(oneDevice.typeDevice.rawValue)
                    .font(.subheadline)
                    .padding()
                //.padding(.trailing, 40)
                    .offset(y:-30)
                
                Spacer()
                
                Image(oneDevice.imageDevice)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.trailing,20)
                    .offset(y:-10)
            }
        }
        .foregroundStyle(Color(hex: "5E69EE"))
        .background {
            Rectangle()
                .foregroundColor(.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    DeviceView(oneDevice: Devices(name: "My principal door", image: "lockDoor", type: .lock, stat: false))
}
