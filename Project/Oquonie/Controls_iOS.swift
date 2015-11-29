
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

var touch_origin:CGPoint!

extension MainViewController
{
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
				poke(point)
			}
		}
		super.touchesEnded(touches, withEvent:event)
	}
	
	func poke(point:CGPoint)
	{
		if dialog.isActive == true {
			dialog.hideModal()
		}
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
		
		// Poke Controls
		
		if point.x < view.frame.size.width * 0.33 && point.y < view.frame.size.height * 0.33 { player.move(0, y: 1) }
		else if point.x > view.frame.size.width * 0.33 && point.y < view.frame.size.height * 0.33 { player.move(1, y: 0) }
		else if point.x < view.frame.size.width * 0.33 && point.y > view.frame.size.height * 0.33 { player.move(-1, y: 0) }
		else if point.x > view.frame.size.width * 0.33 && point.y > view.frame.size.height * 0.33 { player.move(0, y: -1) }
	}
}