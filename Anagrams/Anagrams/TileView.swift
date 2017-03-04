//
//  TileView.swift
//  Anagrams
//
//  Created by Rishi Pochiraju on 7/16/16.
//  Copyright © 2016 SPK Dev. All rights reserved.
//

import UIKit

protocol TileDragDelegateProtocol {
    func tileView(tileView: TileView, didDragToPoint: CGPoint)
}

class TileView: UIImageView {
    
    private var xOffset: CGFloat = 0.0
    private var yOffset: CGFloat = 0.0
    
    var dragDelegate: TileDragDelegateProtocol?
    
    var letter: Character
    
    var isMatched: Bool = false
    
    required init(coder aDecoder:NSCoder) {
        fatalError("use init(letter:, sideLength:")
    }
    
    //5 create a new tile for a given letter
    init(letter:Character, sideLength:CGFloat) {
        self.letter = letter
        
        //the tile background
        let image = UIImage(named: "tile")!
        
        //superclass initializer
        //references to superview's "self" must take place after super.init
        super.init(image:image)
        
        //6 resize the tile
        let scale = sideLength / image.size.width
        self.frame = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
        
        //more initialization here
        
        let letterLabel = UILabel(frame: self.bounds)
        letterLabel.textAlignment = NSTextAlignment.Center
        letterLabel.textColor = UIColor.whiteColor()
        letterLabel.backgroundColor = UIColor.clearColor()
        letterLabel.text = String(letter).uppercaseString
        letterLabel.font = UIFont(name: "Avenir", size: 78.0*scale)
        self.addSubview(letterLabel)
        
        self.userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.locationInView(self.superview)
            xOffset = point.x - self.center.x
            yOffset = point.y - self.center.y
        }
    }
    
    //2
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.locationInView(self.superview)
            self.center = CGPointMake(point.x - xOffset, point.y - yOffset)

        }
    }
    
    //3
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchesMoved(touches, withEvent: event)
        dragDelegate?.tileView(self, didDragToPoint: self.center)
        
        let tileCenterX = self.center.x
        let tileCenterY = self.center.y
        
        for (var i = 0; i < targetX.count; i += 1){
            if (targets.count <= 6){
                if (((tileCenterX - targetX[i] <= 43) && (tileCenterY - targetY <= 43)) || ((tileCenterX + targetX[i] <= 43) && (tileCenterY - targetY <= 43)) || ((tileCenterX - targetX[i] <= 43) && (tileCenterY + targetY <= 43)) || ((tileCenterX + targetX[i] <= 43) && (tileCenterY + targetY <= 43))){
                    self.center = CGPointMake(targetX[i], targetY)
                    break
                }
            }else{
                if (((tileCenterX - targetX[i] <= 23) && (tileCenterY - targetY <= 23)) || ((tileCenterX + targetX[i] <= 23) && (tileCenterY - targetY <= 23)) || ((tileCenterX - targetX[i] <= 23) && (tileCenterY + targetY <= 23)) || ((tileCenterX + targetX[i] <= 23) && (tileCenterY + targetY <= 23))){
                    self.center = CGPointMake(targetX[i], targetY)
                    break
                }
            }
        }
        
        
    }
    
}
