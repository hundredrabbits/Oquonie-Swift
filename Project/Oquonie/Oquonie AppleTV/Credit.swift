
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Credit : Event
{
	init(x:Int,y:Int,id:Int,orientation:Orientation = .l)
	{
		super.init(x: x, y: y)
		if id == 1 { updateSprite("event.rekka.png") } else{ updateSprite("event.devine.png") }
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