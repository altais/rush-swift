//
//  FirstViewController.swift
//  Altais
//
//  Created by swift on 19/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var places = [Dictionary<String,String>()]

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var choiceType: UISegmentedControl!
    var manager = CLLocationManager()
    var school = MKPointAnnotation()
    
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if places.count == 1 {
            places.removeAtIndex(0)
        }
        if places.count == 0 {
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
            places.append(["name":"Tour Eiffel","lat":"48.858561","lon":"2.294508"])
        }
        
        map.mapType = MKMapType.Satellite
        choiceType.selectedSegmentIndex = 1
        school.coordinate = CLLocationCoordinate2DMake(48.896853, 2.318381)
        school.title = "Ecole 42"
        school.subtitle = "Cybercafé, Hôtel et Cinéma"
        map.addAnnotation(school)
        map.centerCoordinate = school.coordinate
        map.setRegion(MKCoordinateRegionMake(school.coordinate, MKCoordinateSpanMake(0.005,0.005)), animated: true)
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        for var index = 0; index < places.count; ++index {
            var place = MKPointAnnotation()
            place.coordinate = CLLocationCoordinate2DMake(NSString(string: places[index]["lat"]!).doubleValue, NSString(string: places[index]["lon"]!).doubleValue)
            place.title = places[index]["name"]
            map.addAnnotation(place)
        }

    }
    
    @IBAction func zoom(sender: UIStepper) {
        map.setRegion(MKCoordinateRegionMake(school.coordinate, MKCoordinateSpanMake(sender.value,sender.value)), animated: true)
        println(sender.value)
    }

    @IBAction func indexChanged(sender: AnyObject) {
        if (choiceType.selectedSegmentIndex == 0) {
            map.mapType = MKMapType.Standard
        }
        else if (choiceType.selectedSegmentIndex == 1) {
            map.mapType = MKMapType.Satellite
        }
        else {
            map.mapType = MKMapType.Hybrid
        }
    }
    
    @IBAction func zoomOnUser(sender: AnyObject) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        map.setUserTrackingMode(MKUserTrackingMode.FollowWithHeading, animated: true)
    }   
}

