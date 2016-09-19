
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Map : Event
{
	var world:String!
	
	init(x:Int,y:Int,world:String)
	{
		super.init(x: x, y: y)
		
		self.world = world
	}
	
	override func collide()
	{
		player.isMoving = false
		player.showOverlay("map.\(world!).png")
		
		audio.play(.dialog, name: "owl")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}
