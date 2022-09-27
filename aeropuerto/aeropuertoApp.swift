//
//  aeropuertoApp.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import SwiftUI

@main
struct aeropuertoApp: App {

    let radios = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
    
            HomeView().environmentObject(radios)
          
        }
    }
}
