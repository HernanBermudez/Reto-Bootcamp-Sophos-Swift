//
//  OfficesViewModel.swift
//  Sophos App
//
//  Created by 1801C724748LM on 27/12/2022.
//

import Foundation
import MapKit

@MainActor
class OfficesViewModel : ObservableObject {
    @Published var offices = OfficesItems(Items: [Offices()])
    @Published var longitudes : Array<CLLocationDegrees> = []
    @Published var latitudes : Array<CLLocationDegrees> = []
    @Published var coordinates : Array<CLLocationCoordinate2D> = []
    @Published var officeToShow = MKCoordinateRegion()
    @Published var officesPin = []
    
    func fetchOffices() async {
        
        guard let url = URL(string: officesUrl) else {
            print("Invalid URL")
            return
        }
        print(url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            if let decodedResponse = try! JSONDecoder().decode(OfficesItems?.self, from: data){
                offices = decodedResponse
                for (index, office) in offices.Items.enumerated(){
                    longitudes.append(CLLocationDegrees(office.Longitud)!)
                    latitudes.append(CLLocationDegrees(office.Latitud)!)
                    coordinates.append(CLLocationCoordinate2D(latitude: CLLocationDegrees(office.Latitud)!, longitude: CLLocationDegrees(office.Longitud)!))
                    officesPin.append(office.Nombre)
                    officesPin.append(coordinates[index])
                }
                print(longitudes[2])
                print(latitudes[2])
                officeToShow = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitudes[3], longitude: longitudes[3]), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                print(officeToShow)
                print("\(officesPin[4]) loc: \(officesPin[5])")
            }
        } catch {
            print("Could not find offices nearby")
        }
    }
}
