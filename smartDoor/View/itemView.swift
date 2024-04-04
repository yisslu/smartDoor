//
//  itemView.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 02/04/24.
//

import SwiftUI

struct itemView: View {
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
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Image(oneDevice.imageDevice)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.trailing,20)
                    .offset(y:-10)
            }
        }
        .background {
            Rectangle()
                .opacity(0.3)
                .foregroundColor(.gray)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    itemView(oneDevice: Devices(name: "My principal door", image: "lockDoor", type: .lock))
}
