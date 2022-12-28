//
//  OfficesView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI
import MapKit

struct OfficesView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        NavigationSplitView {
            Map(coordinateRegion: $region)
                        .frame(width: 400, height: 700)
        } detail: {
            
        }.toolbar(content: {
            NavMenu()
        })
        .navigationTitle("Oficinas")
    }
}
