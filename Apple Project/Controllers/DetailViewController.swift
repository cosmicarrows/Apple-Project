//
//  DetailViewController.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/7/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    var city: City?
    
    let regionRadius: CLLocationDistance = 100
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let shownCity = city else { return }
        
        let initialLocation = CLLocation.init(latitude: shownCity.coord.lat, longitude: shownCity.coord.lon)
        
        
        zoomMapOn(location: initialLocation)
        
        let annotation = MKPointAnnotation.init()
        
        annotation.coordinate = CLLocationCoordinate2D.init(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        
        mapView.addAnnotation(annotation)
        
    }
    func zoomMapOn(location: CLLocation){
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
