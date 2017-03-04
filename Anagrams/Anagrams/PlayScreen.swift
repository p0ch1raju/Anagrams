//
//  PlayScreen.swift
//  Anagrams
//
//  Created by Rishi Pochiraju on 7/8/16.
//  Copyright © 2016 SPK Dev. All rights reserved.
//

var targetX = [CGFloat]()
var targetY: CGFloat = 0.0
var tileX = [CGFloat]()
var tileY: CGFloat = 0.0
var answersArray = [Character]()

var targetCenters = [CGPoint]()
var tiles = [TileView]()
var targets = [TargetView]()


import UIKit
import GoogleMobileAds

class PlayScreen: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    var scrambled = ""
    var solution = ""
    var imageViewCheck = UIImageView()
    var timer = NSTimer()
    var counter = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loadTiles()
        
    }
    
    func loadTiles() {
        
        let TileMargin: CGFloat = 20.0
        
        let screenHeight = Double(self.view.frame.size.height)
        let screenWidth = Double(self.view.frame.size.width)
        
        var width90 = 0.9 * screenWidth
        var lettersDistance = width90 / Double(actualWords[indexSelected].characters.count)
        var addEveryTime = width90 / Double(actualWords[indexSelected].characters.count)
        var lettersWidth = CGFloat(0.9 * lettersDistance)
        
        answersArray.removeAll()
        targetX.removeAll()
        targetY = 0.0
        tileX.removeAll()
        tileY = 0.0
        
        let count = actualWords[indexSelected].characters.count
        for char in scrambled.characters{
            let tile = TileView(letter: char, sideLength: lettersWidth)
            if (count == 3){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.111), CGFloat(screenHeight/4*3))
            }else if (count == 4){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.074), CGFloat(screenHeight/4*3))
            }else if (count == 5){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.049), CGFloat(screenHeight/4*3))
            }else if (count == 6){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.027), CGFloat(screenHeight/4*3))
            }else if (count == 7){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.012), CGFloat(screenHeight/4*3))
            }else if (count == 8){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0098), CGFloat(screenHeight/4*3))
            }else if (count == 9){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0068), CGFloat(screenHeight/4*3))
            }else if (count == 10){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0035), CGFloat(screenHeight/4*3))
            }else if (count == 11){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0001), CGFloat(screenHeight/4*3))
            }else if (count == 12){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0000723), CGFloat(screenHeight/4*3))
            }else if (count == 13){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.00003), CGFloat(screenHeight/4*3))
            }else if (count == 14){
                tile.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0000008), CGFloat(screenHeight/4*3))
            }else if (count == 15){
                tile.center = CGPointMake(CGFloat(lettersDistance), CGFloat(screenHeight/4*3))
            }else if (count == 16){
                tile.center = CGPointMake(CGFloat(lettersDistance), CGFloat(screenHeight/4*3))
            }
            
            tiles.append(tile)
            tile.dragDelegate = self
            self.view.addSubview(tile)
            lettersDistance += addEveryTime
        }
        
        width90 = 0.9 * screenWidth
        lettersDistance = width90 / Double(actualWords[indexSelected].characters.count)
        addEveryTime = width90 / Double(actualWords[indexSelected].characters.count)
        lettersWidth = CGFloat(0.9 * lettersDistance)
        
        targetCenters.removeAll()
        for char in solution.characters{
            let target = TargetView(letter: char, sideLength: lettersWidth)
            answersArray.append(char)
            if (count == 3){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.111), CGFloat(screenHeight * 0.4))
            }else if (count == 4){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.074), CGFloat(screenHeight * 0.4))
            }else if (count == 5){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.049), CGFloat(screenHeight * 0.4))
            }else if (count == 6){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.027), CGFloat(screenHeight * 0.4))
            }else if (count == 7){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.012), CGFloat(screenHeight * 0.4))
            }else if (count == 8){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0098), CGFloat(screenHeight * 0.4))
            }else if (count == 9){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0068), CGFloat(screenHeight * 0.4))
            }else if (count == 10){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0035), CGFloat(screenHeight * 0.4))
            }else if (count == 11){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0001), CGFloat(screenHeight * 0.4))
            }else if (count == 12){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0000723), CGFloat(screenHeight * 0.4))
            }else if (count == 13){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.00003), CGFloat(screenHeight * 0.4))
            }else if (count == 14){
                target.center = CGPointMake(CGFloat(lettersDistance - width90 * 0.0000008), CGFloat(screenHeight * 0.4))
            }else if (count == 15){
                target.center = CGPointMake(CGFloat(lettersDistance), CGFloat(screenHeight * 0.4))
            }else if (count == 16){
                target.center = CGPointMake(CGFloat(lettersDistance), CGFloat(screenHeight * 0.4))
            }
            
            targets.append(target)
            targetCenters.append(target.center)
            targetX.append(target.center.x)
            targetY = target.center.y
            self.view.addSubview(target)
            lettersDistance += addEveryTime
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeViewDidLoad()
        
        let bannerView2 = GADBannerView()
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView2.adUnitID = "ca-app-pub-2830059983414219/9100025485"
        bannerView2.rootViewController = self
        bannerView2.loadRequest(GADRequest())
        
        bannerView2.frame = CGRect(x: 0.0, y: self.view.frame.size.height - 50, width: self.view.frame.size.width, height: 50.0)
        bannerView = bannerView2
        self.view.addSubview(bannerView)
        
        

        // Do any additional setup after loading the view.
        
    }
    
    func initializeViewDidLoad(){
        isPlaying = true
        
        scrambled = scrambledWords[indexSelected]
        solution = actualWords[indexSelected]
        
        
        if (userLevel < indexSelected + 1){
            userLevel = indexSelected + 1
        }
        
        self.navigationItem.title = "LEVEL \(indexSelected + 1)"
        
        let imageName = "checkmark.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: self.view.frame.size.width/2 - 40, y: self.view.frame.size.height / 6.5, width: 100.0, height: 100.0)
        imageViewCheck = imageView
        view.addSubview(imageViewCheck)
        imageViewCheck.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func placeTile(tileView: TileView, targetView: TargetView) {

        targetView.isMatched = true
        tileView.isMatched = true
        
    }
    
    func checkForSuccess() {
        for targetView in targets {
            if targetView.isMatched == false {
                return
            }
        }
        
        print("game is won")
        checkAcrossScreen()
    }
    
    func checkAcrossScreen(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        
        imageViewCheck.hidden = false
        
        counter += 1
        
        if (counter == 4){
            timer.invalidate()
            counter = 0
            resetScene()
        }
        
    }
    
    func resetScene(){
        tiles.removeAll()
        targets.removeAll()
        for view in self.view.subviews {
            if view != bannerView {
                view.removeFromSuperview()
            }
        }
        indexSelected += 1
        userLevel = indexSelected + 1
        initializeViewDidLoad()
        loadTiles()
    }
    
}


extension PlayScreen:TileDragDelegateProtocol {
    //a tile was dragged, check if matches a target
    func tileView(tileView: TileView, didDragToPoint point: CGPoint) {
        var targetView: TargetView?
        for tv in targets {
            if tv.frame.contains(point) && !tv.isMatched {
                targetView = tv
                break
            }
        }
        
        self.checkForSuccess()
        
        if let targetView = targetView {
            //2 check if letter matches
            if targetView.letter == tileView.letter {
                self.placeTile(tileView, targetView: targetView)
                self.checkForSuccess()
            }
        }
    }
    
    
}


