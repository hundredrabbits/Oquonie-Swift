
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
		
		start()
    }
	
	func start()
	{
		addGestures()
	}
	
	func addGestures()
	{
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
				player.moveRight()
			case UISwipeGestureRecognizerDirection.Down:
				player.moveDown()
			case UISwipeGestureRecognizerDirection.Left:
				player.moveLeft()
			case UISwipeGestureRecognizerDirection.Up:
				player.moveUp()
			default:
				break
			}
		}
	}
	
	override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?)
	{
		super.pressesEnded(presses, withEvent: event)
		for press in presses
		{
			switch press.type {
			case UIPressType.LeftArrow:
				player.moveLeft()
			case UIPressType.RightArrow:
				player.moveRight()
			case UIPressType.UpArrow:
				player.moveUp()
			case UIPressType.DownArrow:
				player.moveDown()
			default:
				break
			}
		}
	}
	
    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
