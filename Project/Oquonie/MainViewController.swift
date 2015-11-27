
//  Created by Devine Lu Linvega on 2015-11-22.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

class MainViewController: UIViewController
{
	override func viewDidLoad()
	{
		super.viewDidLoad()
		splash_load()
	}
	
	// MARK: Flow -
	
	func splash_load()
	{
		if let scene = SplashGameScene(fileNamed:"splash"){
			let skView = self.view as! SKView
			scene.viewController = self
			scene.scaleMode = .AspectFill
			skView.presentScene(scene)
			scene.start()
		}
	}
	
	func splash_exited()
	{
		game_load()
	}
	
	func game_load()
	{
		if let scene = MainGameScene(fileNamed:"splash"){
			let skView = self.view as! SKView
			scene.viewController = self
			scene.size = self.view.frame.size
			scene.scaleMode = .AspectFit
			skView.presentScene(scene)
			scene.start()
		}
	}
	
	func game_exit()
	{
		
	}
	
	// MARK: Controls -
	
	var touch_origin:CGPoint!
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
	{
		if let touch = touches.first {
			let point = touch.locationInView(self.view)
			touch_origin = point
		}
		super.touchesBegan(touches, withEvent:event)
	}
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
	{
		/*
		if let touch = touches.first {
		let point = touch.locationInView(self.view)
		}
		super.touchesMoved(touches, withEvent:event)
		*/
	}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
	{
		if let touch = touches.first {
			let point = touch.locationInView(self.view)
			
			if distanceBetweenTwoPoints(point, b: touch_origin) > templates.spell.width/2 {
				if point.y < touch_origin.y && point.x > touch_origin.x { player.move(1, y: 0) }
				if point.y < touch_origin.y && point.x < touch_origin.x { player.move(0, y: 1) }
				if point.y > touch_origin.y && point.x > touch_origin.x { player.move(0, y: -1) }
				if point.y > touch_origin.y && point.x < touch_origin.x { player.move(-1, y: 0) }
			}
			else{
				poke()
			}
		}
		super.touchesEnded(touches, withEvent:event)
	}
	
	func poke()
	{
		if dialog.isActive == true {
			dialog.hideModal()
		}
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
	}
	
	func installGestures()
	{
		/*
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
		*/
	}
	
	func respondToSwipeGesture(gesture: UIGestureRecognizer)
	{
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizerDirection.Right:
				player.move(1, y: 0)
			case UISwipeGestureRecognizerDirection.Down:
				player.move(0, y: -1)
			case UISwipeGestureRecognizerDirection.Left:
				player.move(-1, y: 0)
			case UISwipeGestureRecognizerDirection.Up:
				player.move(0, y: 1)
			default:
				break
			}
		}
	}
//	
//	override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?)
//	{
//		super.pressesEnded(presses, withEvent: event)
//		for press in presses
//		{
//			switch press.type {
//			case UIPressType.LeftArrow:
//				player.move(-1, y: 0)
//			case UIPressType.RightArrow:
//				player.move(1, y: 0)
//			case UIPressType.UpArrow:
//				player.move(0, y: 1)
//			case UIPressType.DownArrow:
//				player.move(0, y: -1)
//			default:
//				break
//			}
//		}
//	}
	
	// MARK: Defaults -
	
	override func shouldAutorotate() -> Bool
	{
		return true
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
	{
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			return .AllButUpsideDown
		} else {
			return .All
		}
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
	}
	
	override func prefersStatusBarHidden() -> Bool
	{
		return true
	}
}
