//
//  MapView.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//
import MapKit
import SwiftUI
import Combine
import CoreLocation

struct MapView: View {
    
    @StateObject var json = LocationViewModel()
    @State  var radio: Double
    
     
    //@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.3907336, longitude: -99.2854134), span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8))
    
    var body: some View {
      
        VStack{
            Map(coordinateRegion: $json.userLocation,interactionModes: .all, userTrackingMode: nil, annotationItems: json.dataLocation ){ location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)){
                     VStack{
                     Text(location.name)
                     .font(.caption2)
                     .bold()
                     Image(systemName: "airplane.circle.fill")
                             .font(.system(size: 40))
                             .foregroundColor(.red)
                     
                     }
                }
            }
        }
       
    }
}
    


