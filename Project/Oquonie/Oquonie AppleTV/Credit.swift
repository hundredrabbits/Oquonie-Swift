
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Credit : Event
{
	var who:String!
	
	init(x:Int,y:Int,who:String,orientation:Orientation = .l)
	{
		super.init(x: x, y: y)
		
		self.who = who
		
		updateSprite("event.\(who).png")
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func onRoomEnter()
	{
		player.isFinishedPart1 = true
	}
	
	override func collide()
	{
		dialog.bubble.texture = textureWithName("dialog.bubble.\(who).png")
		dialog.showModal(dialogs.blank(), eventName: who)
	}
	
	func disapear()
	{
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}