//
//  RowDevice.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 04/04/24.
//

import SwiftUI

struct ListDevices: View, Identifiable {
    var id = UUID()
    var oneRow = BrainDevices()
    let columnLayout = Array(repeating: GridItem(spacing: 10.0), count: 2)
    @State private var showingDetail = [UUID : Bool]()
    @State private var logoStatus = "lock.fill"
    @State private var labelStatus = "Cerrado"
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columnLayout){
                    ForEach(oneRow.devices){
                        device in
                        Button{
                            showingDetail[device.id, default: false].toggle()
                        }label: {
                            DeviceView(oneDevice: device)
                        }
                        .sheet(isPresented: Binding(
                            get: { self.showingDetail[device.id, default: false] },
                            set: { self.showingDetail[device.id] = $0 }
                        )) {
                            switch device.typeDevice.rawValue{
                            case Types.lock.rawValue:
                                DeviceDetailLock(brain: device, logoLocked: $logoStatus, labelStatus: $labelStatus)
                                    .presentationDetents([.medium,.height(550)])
                                    .presentationDragIndicator(.visible)
                                    .frame(width:500)
                            case Types.door.rawValue:
                                DeviceDetailDoor(brain: device, logoLocked: $logoStatus, labelStatus: $labelStatus)
                                    .presentationDetents([.medium,.height(550)])
                                    .presentationDragIndicator(.visible)
                                    .frame(width:500)
                            default:
                                fatalError("Cannot display the view")
                            }
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
