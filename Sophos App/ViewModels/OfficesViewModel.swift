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
    @Published var coordinates : Array<CLLocationCoordinate2D> = []
    @Published var officeName : Array<String> = []
    @Published var annotations : Array<OfficePin> = []
    @Published var officeToShow = MKCoordinateRegion()
    
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
                    coordinates.append(CLLocationCoordinate2D(latitude: CLLocationDegrees(office.Latitud)!, longitude: CLLocationDegrees(office.Longitud)!))
                    officeName.append(office.Nombre)
                    annotations.append(OfficePin(name: officeName[index], coordinate: coordinates[index]))
                }
                officeToShow = MKCoordinateRegion(center: coordinates[3], span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                print(officeToShow)
            }
        } catch {
            print("Could not find offices nearby")
        }
    }
}
