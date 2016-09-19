
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class RedEnd : Event
{
	init(x:Int,y:Int,orientation:Orientation = .l)
	{
		super.init(x: x, y: y)
		updateSprite("event.redghost.1.png")
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func onRoomEnter()
	{
	}
	
	override func collide()
	{
		player.lock()
		dialog.showModal(dialogs.end1(), eventName: "redghost")
		
		self.run(SKAction.fadeAlpha(to: 0, duration: 2),completion:{
			self.updateSprite("event.redgirl.1.png")
			self.run(SKAction.fadeAlpha(to: 1, duration: 2),completion:{
				dialog.hideModal()
				Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(RedEnd.dialog2), userInfo: nil, repeats: false)
				Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(RedEnd.leave), userInfo: nil, repeats: false)
			})
		})
		audio.play(.dialog, name: "nepturne")
	}
	
	func dialog2()
	{
		dialog.showModal(dialogs.end2(), eventName: "redghost")
	}
	
	func leave()
	{
		player.teleportTrigger(106,to_x: 0,to_y: 0)
	}
	
	func disapear()
	{
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}
