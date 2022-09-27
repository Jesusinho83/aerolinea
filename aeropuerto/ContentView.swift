//
//  ContentView.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import SwiftUI

struct ContentView: View {
    
   @State private var selection = 0
    @State var radio: Double
    
    var body: some View {
        TabView(selection: $selection) {
        
            MapView(radio: radio.self) .tabItem {
                Label("Mapa", systemImage: "map.circle.fill")
            }
            ListasView().tabItem {
                Label("Listas", systemImage: "list.bullet.circle.fill")
            }
            
        }
    }
}


