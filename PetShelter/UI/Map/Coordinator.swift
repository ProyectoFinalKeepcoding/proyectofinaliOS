//
//  Coordinator.swift
//  PetShelter
//
//  Created by Francisco Javier Alarza Sanchez on 6/2/23.
//

import Foundation
import GoogleMaps
import SwiftUI

class Coordinator: NSObject, GMSMapViewDelegate {
    var places: [ShelterPointModel] = []
    
    func addMarkers(mapView: GMSMapView) {
        places.forEach { place in
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: place.address.latitude, longitude: place.address.longitude))
            
            switch place.shelterType {
            case .particular:
                marker.iconView = setMarkerImage(image: UIImage(systemName: "person.crop.circle"), size: 30, color: .red)
            case .shelterPoint:
                marker.iconView = setMarkerImage(image: UIImage(systemName: "house.and.flag.circle"), size: 30, color: .black)
            case .veterinary:
                marker.iconView = setMarkerImage(image: UIImage(systemName: "cross.case.circle"), size: 30, color: .blue)
            case .localGovernment:
                marker.iconView = setMarkerImage(image: UIImage(systemName: "house.lodge.circle"), size: 30, color: .brown)
            }
            
            marker.title = place.name
            marker.map = mapView
        }
    }
    
    func setMarkerImage(image: UIImage?, size: Int, color: UIColor) -> UIImageView{
        guard let image else {
            return UIImageView(image: UIImage(systemName: "house.lodge"))
        }
        let tintedImage = image.withTintColor(color, renderingMode: .alwaysOriginal)
        let scaledImage = tintedImage.resizeImageTo(size: CGSize(width: size, height: size))
        return UIImageView(image: scaledImage)
    }
    
}