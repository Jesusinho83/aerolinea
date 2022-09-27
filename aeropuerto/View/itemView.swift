//
//  itemView.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import SwiftUI

struct itemView: View {
    
    @State var selection: Int = 2
    var body: some View {
        TabView(selection: $selection){
            
           
            MapView().tabItem{
                Label("Mapa", systemImage: "map.circle.fill").font(.title2)
            }
            .tag(1)
            ListasView().tabItem{
                Label("Listas", systemImage: "list.bullet.circle.fill").font(.title2)
            }
            .tag(2)
        }
    }
}

struct itemView_Previews: PreviewProvider {
    static var previews: some View {
        itemView()
    }
}
