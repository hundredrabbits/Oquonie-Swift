
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Map : Event
{
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
	}
	
	override func collide()
	{
		print("Hit map")
		player.isMoving = false
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}