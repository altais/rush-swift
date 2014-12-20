//
//  PlacesViewController.swift
//  Altais
//
//  Created by swift on 20/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PlacesViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        map.mapType = MKMapType.Satellite
        var place = MKPointAnnotation()
        place.coordinate = CLLocationCoordinate2DMake(NSString(string: places[activePlace]["lat"]!).doubleValue, NSString(string: places[activePlace]["lon"]!).doubleValue)
        place.title = places[activePlace]["name"]
        map.addAnnotation(place)
        map.centerCoordinate = place.coordinate
        map.setRegion(MKCoordinateRegionMake(place.coordinate, MKCoordinateSpanMake(0.005,0.005)), animated: true)
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zoomOnUser(sender: AnyObject) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        map.setUserTrackingMode(MKUserTrackingMode.FollowWithHeading, animated: true)
    }
}

