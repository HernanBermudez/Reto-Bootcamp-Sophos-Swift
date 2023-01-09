//
//  OfficesView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 03/12/2022.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct OfficesView: View {
    
    @EnvironmentObject var officesVM : OfficesViewModel
    @EnvironmentObject var loginVM : LoginViewModel
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationSplitView {
            ZStack{
                Map(coordinateRegion: $officesVM.officeToShow, showsUserLocation: true, annotationItems: officesVM.annotations, annotationContent: { office in
                    //MapMarker(coordinate: $0.coordinate)
                    MapAnnotation(coordinate: office.coordinate, content: {
                        Image(systemName: "mappin.circle.fill").foregroundColor(.red)
                        Text(office.name)
                    })
                }).ignoresSafeArea()
                
                VStack {
                    if let location = locationManager.location {
                        Text("**Current location:** \(location.latitude), \(location.longitude)")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding()
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    Spacer()
                    LocationButton {
                        locationManager.requestLocation()
                    }
                    .frame(width: 180, height: 40)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .foregroundColor(.white)
                }
                .padding()
            }.navigationDestination(for: String.self) { value in
                switch value{
                case "Send":
                    SendDocumentsView()
                case "See":
                    SeeDocumentsView()
                case "Offices":
                    OfficesView()
                default:
                    HomeView()
                }
            }
        } detail: {
            
        }
        .toolbar(content: {
            NavMenu()
        })
        .environmentObject(officesVM)
        .navigationTitle(loginVM.languageSelector ? "Offices" : "Oficinas")
    }
}
