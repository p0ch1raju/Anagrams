//
//  TargetView.swift
//  Anagrams
//
//  Created by Rishi Pochiraju on 7/16/16.
//  Copyright © 2016 SPK Dev. All rights reserved.
//


import UIKit

class TargetView: UIImageView {
    var letter: Character
    var isMatched:Bool = false
    
    //this should never be called
    required init(coder aDecoder:NSCoder) {
        fatalError("use init(letter:, sideLength:")
    }
    
    init(letter:Character, sideLength:CGFloat) {
        self.letter = letter
        
        let image = UIImage(named: "slot1")!
        super.init(image:image)
        
        let scale = sideLength / image.size.width
        self.frame = CGRectMake(0, 0, image.size.width * scale, image.size.height * scale)
    }
}