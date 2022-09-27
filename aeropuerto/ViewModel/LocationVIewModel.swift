//
//  LocationVIewModel.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import Foundation
import CoreLocation
import MapKit
    

class LocationViewModel:  NSObject, ObservableObject, CLLocationManagerDelegate {
   
    private var locationManager = CLLocationManager()
    @Published var locations : CLLocation? = nil
    @Published var userLocation: MKCoordinateRegion = .init()
    
    private let APi_KEY = "7bb662a15dmsh0eb3c6491b9105dp16f9a0jsndfe1b47bfdd0"
    private let API_HOST = "aviation-reference-data.p.rapidapi.com"
    
    @Published var dataLocation: [locationModel] = []
    
    
    override init(){
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("localizacion es  \(location)")
         
       // self .locations = location
        userLocation  = .init(center: location.coordinate,span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2))
        fetch(foorCoordinates: location.coordinate)
    }
    
     func fetch(foorCoordinates coordinate: CLLocationCoordinate2D){
        
        guard let url = URL(string: "https://aviation-reference-data.p.rapidapi.com/airports/search?rapidapi-key=7bb662a15dmsh0eb3c6491b9105dp16f9a0jsndfe1b47bfdd0&lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&radius=100") else { return }
        
        URLSession.shared.dataTask(with: url) { data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([locationModel].self, from: data)
                DispatchQueue.main.async {
                    self.dataLocation = json
                }
            }catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
            
        }.resume()
    }
}


    
    
    
    

   



