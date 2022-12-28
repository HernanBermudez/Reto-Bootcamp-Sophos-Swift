//
//  OfficesView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI
import MapKit

struct OfficesView: View {
    
    @EnvironmentObject var officesVM : OfficesViewModel
    var body: some View {
        NavigationSplitView {
            Map(coordinateRegion: $officesVM.officeToShow)
                        .frame(width: 400, height: 700)
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .environmentObject(officesVM)
        .navigationTitle("Oficinas")
    }
}
