
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class NoFace : Event
{
	init(x:Int,y:Int, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y)
		
		if orientation == Orientation.r { sprite.xScale = -1.0 }
		updateSprite("event.noface.1.png")
	}
	
	override func collide()
	{
		if player.persona != .catfishbird {
			dialog.showModal(dialogs.confusion(), eventName: "noface")
			return
		}
		dialog.showModal(dialogs.friendFriendFriend(), eventName: "noface")
		player.teleportTrigger(Waypoints.nastazie.rawValue)
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	override func refreshSprite()
	{
		sprite.texture = textureWithName("event.noface.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}