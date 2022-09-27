//
//  HomeView.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import SwiftUI

import CoreLocation
import MapKit

struct HomeView: View {
    @State private var search  = false
    @State var radio : Double = 0
    @State var isEditing: Bool = false
    
    @StateObject var json = LocationViewModel()
    @EnvironmentObject var radios : LocationViewModel
   
  
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [  .green, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Text("AIRPORT")
                        .font(.system(size: 70))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 500.0)
                        .bold()
                }
                VStack{
                    Text("Finder")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding(.bottom,400.0)
                        .bold()
                        
                        
                }
                VStack{
                    Text(String(format:"%.0f",radio) )
                 
                        .font(.system(size: 80))
                        .bold()
                        .foregroundColor(.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: 100)
                    Slider(value: $radio, in: 0...100, step: 1, onEditingChanged: { (editing) in
                        isEditing = editing
                    })
                    .accentColor(.white)
                    .padding()
                    Text("Radius in KM")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    Button{
                        search.toggle()
                        
                    } label: {
                        Text("Search")
                            .font(.system(size: 40))
                            .bold()
                            
                            
                    }
                    .padding(.top)
                    .buttonStyle(.bordered)
                        .tint(.black)
                        .navigationDestination(isPresented: $search) {
                            ContentView(radio: radio)
                            
                        }
                }
                
              
               
            }
         
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
