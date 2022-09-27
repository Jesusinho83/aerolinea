//
//  ListasView.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import SwiftUI

struct ListasView: View {
    
    @StateObject var json = LocationViewModel()
    
    var body: some View {
        
            VStack{
                
                List(json.dataLocation, id:\.id ){ item in
                    
                    VStack(alignment: .leading){
                        Image(systemName: "airplane")
                            .font(.title)
                            .foregroundColor(.red)
                        Text(item.name).font(.title)
                            .foregroundColor(.blue)
                        
                        Text(item.alpha2CountryCode)
                            .font(.subheadline)
                            .foregroundColor(.green)
                        
                        Text(String(item.longitude))
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                        
                    }
                }.padding(.trailing)
                
            }
        }
        
    }
    


