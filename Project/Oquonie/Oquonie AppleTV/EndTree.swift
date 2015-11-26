
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class EndTree : Event
{
	init(x:Int,y:Int,orientation:Orientation = .l)
	{
		super.init(x: x, y: y)
		updateSprite("event.tree.5.png")
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func onRoomEnter()
	{
	}
	
	override func collide()
	{
		
	}
	
	func dialog2()
	{
		
	}
	
	func leave()
	{
		
	}
	
	func disapear()
	{
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}