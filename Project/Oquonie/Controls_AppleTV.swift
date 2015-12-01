
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

extension MainViewController
{
	func installGestures()
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
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
		
		if dialog.isActive == true {
			dialog.hideModal()
			return
		}
		
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

	override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?)
	{
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