
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class Warp : Event
{
	var destination:Int!
	var to_x:Int!
	var to_y:Int!
	
	init(x:Int,y:Int,room:Int,to_x:Int,to_y:Int)
	{
		super.init(x: x, y: y)
		
		self.x = x
		self.y = y
		self.destination = room
		self.to_x = to_x
		self.to_y = to_y
	}
	
	override func collide()
	{
		print("> WARP: \(destination)")
		player.isMoving = false
		
		stage.enter(world.all[destination])
		player.x = self.to_x
		player.y = self.to_y
		player.updatePosition(to_x,y:to_y)
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}