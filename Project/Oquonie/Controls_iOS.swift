
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

var touch_origin:CGPoint!
var touch_hold:CGPoint!
var touchTimer:Timer!
var isHolding:Bool = false

extension MainViewController
{	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if player == nil { return }
		
		if touchTimer != nil { touchTimer.invalidate() }
		
		if let touch = touches.first {
			let point = touch.location(in: self.view)
			touch_origin = point
		}
		super.touchesBegan(touches, with:event)
		
		touchTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(MainViewController.touchesHeld), userInfo: nil, repeats: true)
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if player == nil { return }
		
		if let touch = touches.first {
			let point = touch.location(in: self.view)
			touch_hold = point
		}
		super.touchesMoved(touches, with:event)
	}
	
	func touchesHeld()
	{
		if player == nil { return }
		
		isHolding = true
		if distanceBetweenTwoPoints(touch_hold, b: touch_origin) > self.view.frame.width/10 {
			if touch_hold.y < touch_origin.y && touch_hold.x > touch_origin.x { player.move(1, y: 0) }
			if touch_hold.y < touch_origin.y && touch_hold.x < touch_origin.x { player.move(0, y: 1) }
			if touch_hold.y > touch_origin.y && touch_hold.x > touch_origin.x { player.move(0, y: -1) }
			if touch_hold.y > touch_origin.y && touch_hold.x < touch_origin.x { player.move(-1, y: 0) }
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if player == nil { return }
		
		if isHolding == true {
			touchTimer.invalidate()
			isHolding = false
			return
		}
		if let touch = touches.first {
			let point = touch.location(in: self.view)
			
			if distanceBetweenTwoPoints(point, b: touch_origin) > self.view.frame.width/10 {
				if point.y < touch_origin.y && point.x > touch_origin.x { player.move(1, y: 0) }
				if point.y < touch_origin.y && point.x < touch_origin.x { player.move(0, y: 1) }
				if point.y > touch_origin.y && point.x > touch_origin.x { player.move(0, y: -1) }
				if point.y > touch_origin.y && point.x < touch_origin.x { player.move(-1, y: 0) }
			}
			else{
				poke(point)
			}
		}
		super.touchesEnded(touches, with:event)
		
		touchTimer.invalidate()
	}
	
	func poke(_ point:CGPoint)
	{
		if player == nil { return }
		
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
		
		if dialog.isActive == true {
			dialog.hideModal()
			return
		}
		// Poke Controls
		
		if point.x < view.frame.size.width * 0.33 && point.y < view.frame.size.height * 0.33 { player.move(0, y: 1) }
		else if point.x > view.frame.size.width * 0.66 && point.y < view.frame.size.height * 0.33 { player.move(1, y: 0) }
		else if point.x < view.frame.size.width * 0.33 && point.y > view.frame.size.height * 0.66 { player.move(-1, y: 0) }
		else if point.x > view.frame.size.width * 0.66 && point.y > view.frame.size.height * 0.66 { player.move(0, y: -1) }
		
		audio.play(.interface, name: "click")
	}
	
	override var supportedInterfaceOrientations : UIInterfaceOrientationMask
	{
		if UIDevice.current.userInterfaceIdiom == .phone {
			return .allButUpsideDown
		} else {
			return .all
		}
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
	}
	
	override var prefersStatusBarHidden : Bool
	{
		return true
	}
}
