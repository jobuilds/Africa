//
//  MapView.swift
//  Africa
//
//  Created by Jeren Ott on 3/25/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //Body
    
    var body: some View {
        //No1 Basic Map
        //Map(coordinateRegion: $region)
        
        //No2 Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //Option A: Pin (old style, always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //Option B: Marker (new style, always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //Option C: Custom Basic Annotation (could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//Annotation
        
            //Option D: Complex Map Annotation (could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }//MapAnnotation
        })//Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//HStack
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//HStack
                }//VStack
            }//HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )//background
            .padding()
            , alignment: .top
        )//overlay
    }
}

//Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
