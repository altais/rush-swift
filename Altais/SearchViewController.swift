//
//  AutoEmailTextField.swift
//  AutoCompleteTextFieldApp
//
//  Created by Cedric on 15/12/2014.
//  Copyright (c) 2014 haitou. All rights reserved.
//

import UIKit


class AutoEmailTextField: AutoCompleteTextField {
    
    override func updateData() {
        var text = String(self.text)
        callApi(text) { (success: Bool, results: NSDictionary?) -> () in
            if success == true {
                var json = JSON(results!)
                if json["status"] == "OK" {
                    var adresses = json["predictions"]
                    dispatch_async(dispatch_get_main_queue(), {
                        self.contentSource?.removeAllObjects();
                        for (index: String, subJson: JSON) in adresses {
                            self.contentSource?.addObject(subJson["description"].string!)
                        }
                    })
                }
            }
        }
    }
    func callApi(params : String, postCompleted : (success: Bool, results: NSDictionary?) -> ()) {
        var err: NSError?
        var url:NSURL = NSURL(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(params.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)&types=geocode&language=fr&key=AIzaSyDVWkyuk_TcMeRrHDLgA8UC9rr9xGSwehQ")!
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            var jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            if(err != nil) {
                println(err!.localizedDescription)
                println("Error could not parse JSON")
                postCompleted(success: false, results: nil)
            }
            else {
                postCompleted(success: true, results: jsonObject)
            }
        })
        task.resume()
    }
    
}