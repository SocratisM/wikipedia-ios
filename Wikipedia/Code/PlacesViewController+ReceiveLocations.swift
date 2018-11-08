//
//  PlacesViewController+ReceiveLocations.swift
//  Wikipedia
//
//  Created by Socratis Michaelides on 08/11/2018.
//  Copyright © 2018 Wikimedia Foundation. All rights reserved.
//

import Foundation

extension PlacesViewController {
    @objc public func showLocation(_ location: [String: String]) {
        if let longitudeStr = location["longitude"], let latitudeStr = location["latitude"], let longitude = CLLocationDegrees(longitudeStr),let latitude = CLLocationDegrees(latitudeStr) {
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            showLocationWithCoordinates(coordinates)
        } else if let placeStr = location["place"] {
            showLocationOfPlace(placeStr)
        }
    }
}

fileprivate extension PlacesViewController {
    fileprivate func showLocationOfPlace(_ place: String) {
        searchBarTextDidBeginEditing(searchBar)
        searchBar.text = place
        searchBar(searchBar, textDidChange: place)
        searchBar.becomeFirstResponder()
        searchBarSearchButtonClicked(searchBar)
    }
    
    fileprivate func showLocationWithCoordinates(_ coordinates: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        zoomAndPanMapView(toLocation: location)
    }
}
