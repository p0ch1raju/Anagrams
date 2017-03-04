//
//  TableViewController.swift
//  Anagrams
//
//  Created by Rishi Pochiraju on 7/15/16.
//  Copyright © 2016 SPK Dev. All rights reserved.
//

import UIKit
import GoogleMobileAds

var indexSelected = -1
var isPlaying = false

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (isPlaying == true){
            isPlaying = false
            self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
        }
        
        scrollTableView()
        
        tableView.reloadData()
        
    }
    
    func scrollTableView(){
        let numberOfSections = self.tableView.numberOfSections
        if (userLevel <= 1){
            let indexPath = NSIndexPath(forRow: userLevel - 1, inSection: numberOfSections-1)
            self.tableView.scrollToRowAtIndexPath(indexPath,
                                              atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }else{
            let indexPath = NSIndexPath(forRow: userLevel - 2, inSection: numberOfSections-1)
            self.tableView.scrollToRowAtIndexPath(indexPath,
                                                  atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-2830059983414219/9100025485"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
        
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.whiteColor()
        nav?.barTintColor = UIColor(red: 73/255.0, green: 181/255.0, blue: 22/255.0, alpha: 1.0)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.interactivePopGestureRecognizer?.enabled = false

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return scrambledWords.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = "LEVEL \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .Left
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        cell.textLabel?.textColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        if (indexPath.row > userLevel - 1){
            cell.textLabel?.textColor = UIColor.lightGrayColor()
        }
        cell.textLabel?.font = UIFont(name: "Avenir", size: 27.0)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row < 800 { //for testing purposes, this is set to 790. Need to change "790" to "userLevel"
            let vcName = "play"
            let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
            indexSelected = indexPath.row
            self.navigationController?.pushViewController(viewController!, animated: true)
        }else{
            let completeLevelAlert = UIAlertController(title: "Sorry!", message: "Complete level \(userLevel) first.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){(ACTION) in
            }
            completeLevelAlert.addAction(okAction)
            self.presentViewController(completeLevelAlert, animated: true, completion: nil)
            self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
}
