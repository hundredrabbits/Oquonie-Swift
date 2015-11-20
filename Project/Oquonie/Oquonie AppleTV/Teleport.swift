
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Teleport : Event
{
	var destination:Int!
	
	init(x:Int,y:Int, destination:Int = 1)
	{
		super.init(x: x, y: y)
		self.destination = destination
	}
	
	override func collide()
	{
		print("Warp pad")
		player.isMoving = false
		player.walk(x, destination_y: y)
		player.teleportTrigger(destination)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}