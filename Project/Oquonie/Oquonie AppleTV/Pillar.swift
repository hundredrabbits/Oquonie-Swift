
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class Pillar : Event
{
	var display:Pillar!
	
	init(x:Int,y:Int, display:Pillar! = nil)
	{
		super.init(x: x, y: y)
		
		self.display = display
		
		updateSprite("event.pillar.base.png")
	}
	
	override func collide()
	{
		print("touched pillar")
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}