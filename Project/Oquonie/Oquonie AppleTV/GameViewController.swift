
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import UIKit
import SpriteKit

class GameViewController: UIViewController
{
    override func viewDidLoad()
	{
        super.viewDidLoad()

        if let scene = GameScene(fileNamed: "GameScene") {
            let skView = self.view as! SKView
			scene.size = CGSize(width: 1400, height: 1400)
			scene.scaleMode = .AspectFill
            skView.presentScene(scene)
		}
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeRight.direction = .Right
		self.view.addGestureRecognizer(swipeRight)
		
		let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeDown.direction = .Down
		self.view.addGestureRecognizer(swipeDown)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeUp.direction = .Up
		self.view.addGestureRecognizer(swipeUp)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeLeft.direction = .Left
		self.view.addGestureRecognizer(swipeLeft)
    }
	
	func respondToSwipeGesture(gesture: UIGestureRecognizer)
	{
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizerDirection.Right:
				moveRight()
			case UISwipeGestureRecognizerDirection.Down:
				moveDown()
			case UISwipeGestureRecognizerDirection.Left:
				moveLeft()
			case UISwipeGestureRecognizerDirection.Up:
				moveUp()
			default:
				break
			}
		}
	}
	
	func moveUp()
	{
		print("up")
	}
	
	func moveLeft()
	{
		print("left")
	}
	
	func moveRight()
	{
		print("right")
	}
	
	func moveDown()
	{
		print("down")
	}
	
    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
