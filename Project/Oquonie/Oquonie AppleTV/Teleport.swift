
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Teleport : Event
{
	var destination:Int!
	var to_x:Int!
	var to_y:Int!
	
	init(x:Int,y:Int, destination:Int = 1, to_x:Int, to_y:Int)
	{
		super.init(x: x, y: y)
		
		self.to_x = to_x
		self.to_y = to_y
		self.destination = destination
	}
	
	override func collide()
	{
		player.isMoving = false
		player.walk(x, destination_y: y)
		player.x = to_x
		player.y = to_y
		player.zPosition = stage.eventDepthAtPosition(to_x, y: to_y)
		player.teleportTrigger(destination,to_x: 0,to_y: 0)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}