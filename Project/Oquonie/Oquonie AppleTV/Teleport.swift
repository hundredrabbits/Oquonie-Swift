
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SceneKit
import Foundation

class Teleport : Event
{
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
		updateSprite("event.wizard.png")
	}
	
	override func collide()
	{
		print("Warp pad")
		player.isMoving = false
		player.walk(x, destination_y: y)
		player.teleportTrigger(1)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}