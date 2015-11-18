
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Red : Event
{
	var isSeen:Bool = false
	
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
		updateSprite("event.redghost.1.png")
	}
	
	override func collide()
	{
		print("Hit blocker")
		player.isMoving = false
	}
	
	override func onRoomEnter()
	{
		player.lock()
		self.runAction(SKAction.fadeAlphaTo(0, duration: 1), completion:{ self.isSeen = true ; player.unlock() })
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}