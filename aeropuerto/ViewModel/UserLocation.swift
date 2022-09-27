//
//  UserLocation.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import Foundation
import CoreLocation
import MapKit

class UserLocation: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    private let APi_KEY = "7bb662a15dmsh0eb3c6491b9105dp16f9a0jsndfe1b47bfdd0"
    
    @Published var userLocation: MKCoordinateRegion = .init()
    let manager = CLLocationManager()
    @Published var locations : CLLocation? = nil
    private var  completionHandler: ((locationModel) -> Void)?
    
    public func loadLocation(_completionHandler: @escaping((locationModel) -> Void)) {
      //  self.completionHandler = completionHandler
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    private func makeDataRequest(forCordinates coordinates:CLLocationCoordinate2D){
        guard let url = URL(string: "https://aviation-reference-data.p.rapidapi.com/airports/search?rapidapi-key=\(APi_KEY)&lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&radius=100") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            
            
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data)  {
               // let locationModel = locationModel(response: response)
                self.completionHandler?(locationModel)
            }
            
        }.resume()
    }
    
    struct APIResponse: Codable {
        let iataCode, icaoCode, name, alpha2CountryCode: String
        let latitude, longitude: Double
        var coordinate : CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
    }
}
    /*override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.locations = location
        //userLocation = .init(center: location.coordinate, span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }*/
    
    
    

