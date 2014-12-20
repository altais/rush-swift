//
//  SecondViewController.swift
//  Altais
//
//  Created by swift on 19/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit

var activePlace = 0
var places = [Dictionary<String,String>()]

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if places.count == 1 {
            places.removeAtIndex(0)
        }
        if places.count == 0 {
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel.text = places[indexPath.row]["name"]
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)  {
        println(segue.identifier)
        if segue.identifier == "addPlace" {
            activePlace = -1
        }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        activePlace = indexPath.row
        self.performSegueWithIdentifier("goto_map", sender: indexPath)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}



