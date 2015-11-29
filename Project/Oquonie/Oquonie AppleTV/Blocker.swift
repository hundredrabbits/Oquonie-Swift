
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Blocker : Event
{
	var newDialog:Array<String>! = nil
	var eventName:String! = nil
	
	init(x:Int,y:Int,id:Int! = nil, eventName:String! = nil, newDialog:Array<String>! = nil, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y)
		
		self.newDialog = newDialog
		self.eventName = eventName
		
		if eventName != nil { updateSprite("event.\(self.eventName).png") }
		else { updateSprite("blocker.\(id).png") }
		
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func collide()
	{
		if newDialog != nil { dialog.showModal(newDialog, eventName: self.eventName) }
		player.isMoving = false
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}