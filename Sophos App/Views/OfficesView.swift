//
//  OfficesView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI
import MapKit

struct OfficesView: View {
    
    @ObservedObject var officesVM = OfficesViewModel()
    
    var body: some View {
        NavigationSplitView {
            Map(coordinateRegion: $officesVM.officeToShow, annotationItems: officesVM.annotations){
                MapMarker(coordinate: $0.coordinate)
            }
                        .frame(width: 400, height: 700)
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .onAppear{
            Task{
                await officesVM.fetchOffices()
            }
        }
        .environmentObject(officesVM)
        .navigationTitle("Oficinas")
    }
}
