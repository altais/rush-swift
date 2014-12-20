//
//  SecondViewController.swift
//  Altais
//
//  Created by swift on 19/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activePlace = 0
    var places = [Dictionary<String,String>()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if places.count == 1 {
            places.removeAtIndex(0)
        }
        if places.count == 0 {
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.navigationController?.title = "test"
        //let vc = TwoViewController(nibName: "TwoViewController", bundle: nil)
        //self.navigationController?.pushViewController(vc, animated: true) //accessing the source's navigation controller to push the destination onto the stack.
        //self.parentViewController?.performSegueWithIdentifier("map", sender: indexPath)
        //self.performSegueWithIdentifier("9pv-A4-QxB", sender: indexPath)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}



