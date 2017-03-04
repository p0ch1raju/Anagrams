//
//  CustomSegue.swift
//  Anagrams
//
//  Created by Rishi Pochiraju on 7/8/16.
//  Copyright © 2016 SPK Dev. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    override func perform(){
        
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        
        let window = UIApplication.sharedApplication().keyWindow!
        destinationVC.view.alpha = 0.0
        window.insertSubview(destinationVC.view, belowSubview: sourceVC.view)
        
        UIView.animateWithDuration(0.5, animations: {() ->
            Void in
            sourceVC.view.alpha = 0.0
            destinationVC.view.alpha = 1.0
        }){
            (finished) -> Void in
            sourceVC.view.alpha = 0.0
            sourceVC.presentViewController(destinationVC, animated: false, completion: nil)
        }
    }
}
