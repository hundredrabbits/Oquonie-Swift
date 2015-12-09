
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

extension MainViewController
{
	func installGestures()
	{
		let swipeRightUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeRightUp.direction = UISwipeGestureRecognizerDirection.Right.union(.Up)
		self.view.addGestureRecognizer(swipeRightUp)
		
		let swipeRightDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeRightDown.direction = UISwipeGestureRecognizerDirection.Down.union(.Right)
		self.view.addGestureRecognizer(swipeRightDown)
		
		let swipeLeftUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeLeftUp.direction = UISwipeGestureRecognizerDirection.Up.union(.Left)
		self.view.addGestureRecognizer(swipeLeftUp)
		
		let swipeLeftDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeLeftDown.direction = UISwipeGestureRecognizerDirection.Left.union(.Down)
		self.view.addGestureRecognizer(swipeLeftDown)
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeRight.direction = UISwipeGestureRecognizerDirection.Right
		swipeRight.requireGestureRecognizerToFail(swipeRightUp)
		swipeRight.requireGestureRecognizerToFail(swipeRightDown)
		self.view.addGestureRecognizer(swipeRight)
		
		let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeDown.direction = UISwipeGestureRecognizerDirection.Down
		swipeDown.requireGestureRecognizerToFail(swipeLeftDown)
		swipeDown.requireGestureRecognizerToFail(swipeRightDown)
		self.view.addGestureRecognizer(swipeDown)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeUp.direction = UISwipeGestureRecognizerDirection.Up
		swipeUp.requireGestureRecognizerToFail(swipeRightUp)
		swipeUp.requireGestureRecognizerToFail(swipeLeftUp)
		self.view.addGestureRecognizer(swipeUp)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
		swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
		swipeLeft.requireGestureRecognizerToFail(swipeLeftUp)
		swipeLeft.requireGestureRecognizerToFail(swipeLeftDown)
		self.view.addGestureRecognizer(swipeLeft)
	}
	
	func respondToSwipeGesture(gesture: UIGestureRecognizer)
	{
		if player == nil { return }
		
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
		
		if dialog.isActive == true {
			dialog.hideModal()
			return
		}
		
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizerDirection.Right, UISwipeGestureRecognizerDirection.Right.union(.Up):
				player.move(1, y: 0)
			case UISwipeGestureRecognizerDirection.Down, UISwipeGestureRecognizerDirection.Down.union(.Right):
				player.move(0, y: -1)
			case UISwipeGestureRecognizerDirection.Left, UISwipeGestureRecognizerDirection.Left.union(.Down):
				player.move(-1, y: 0)
			case UISwipeGestureRecognizerDirection.Up, UISwipeGestureRecognizerDirection.Up.union(.Left):
				player.move(0, y: 1)
			default:
				break
			}
		}
	}

	override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?)
	{
		if player == nil { return }
		
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
		
		if dialog.isActive == true {
			dialog.hideModal()
			return
		}
		
		super.pressesEnded(presses, withEvent: event)
		for press in presses
		{
			switch press.type {
			case UIPressType.LeftArrow:
				player.move(-1, y: 0)
			case UIPressType.RightArrow:
				player.move(1, y: 0)
			case UIPressType.UpArrow:
				player.move(0, y: 1)
			case UIPressType.DownArrow:
				player.move(0, y: -1)
			default:
				break
			}
		}
	}
}