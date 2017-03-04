//
//  ViewController.swift
//  Anagrams
//
//  Created by Rishi Pochiraju on 7/6/16.
//  Copyright © 2016 SPK Dev. All rights reserved.
//

import UIKit

var actualWords = [String]()
var scrambledWords = [String]()
var userLevel = 1

let defaults = NSUserDefaults.standardUserDefaults()

class PreScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getWordsFromTextFiles()
        
        //eliminate words that didn't get scrambled
        for (var i = 0; i < actualWords.count; i += 1){
            if (actualWords[i] == scrambledWords[i]){
                actualWords.removeAtIndex(i)
                scrambledWords.removeAtIndex(i)
                i -= 1
            }
        }
        
        if defaults.objectForKey("level") != nil {
            userLevel = defaults.objectForKey("level") as! NSInteger

        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWordsFromTextFiles(){
        let fileName = "Unscrambled.txt"
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        if path == nil {
            print("nil")
        }
        
        var fileContents: String? = nil
        do {
            fileContents = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        } catch _ as NSError {
            print("nil")
        }
        
        actualWords = (fileContents?.componentsSeparatedByString("\n"))!
        
        
        let fileName2 = "Scrambled.txt"
        let path2 = NSBundle.mainBundle().pathForResource(fileName2, ofType: nil)
        if path2 == nil {
            print("nil")
        }
        
        var fileContents2: String? = nil
        do {
            fileContents2 = try String(contentsOfFile: path2!, encoding: NSUTF8StringEncoding)
        } catch _ as NSError {
            print("nil")
        }
        
        scrambledWords = (fileContents2?.componentsSeparatedByString("\n"))!
    }
    
    
}

