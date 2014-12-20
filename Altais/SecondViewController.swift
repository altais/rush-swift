//
//  SecondViewController.swift
//  Altais
//
//  Created by swift on 19/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit

var activePlace = 0

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if segue.identifier == "addPlace" {
            activePlace = -1
        }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        activePlace = indexPath.row
        self.performSegueWithIdentifier("goto_map", sender: indexPath)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            places.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}



