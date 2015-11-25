
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
		if !player.hasPillar(pillar_necomedre) || !player.hasPillar(pillar_nephtaline) || !player.hasPillar(pillar_neomine) || !player.hasPillar(pillar_nestorine) || !player.hasPillar(pillar_nemedique) {
			dialog.showModal(dialogs.confusion(), eventName: "noface")
			return
		}
		dialog.showModal(dialogs.friendFriendFriend(), eventName: "noface")
		player.teleportTrigger(Waypoints.nastazie.rawValue)
	}
	
	override func animateFrame1() { activityFrame = 1 ; updateSprite() }
	override func animateFrame2() { activityFrame = 2 ; updateSprite() }
	override func animateFrame3() { activityFrame = 3 ; updateSprite() }
	
	func updateSprite()
	{
		if isVisible == false && activityFrame != 1 { activityFrame = 1 ; sprite.texture = textureWithName("event.noface.\(activityFrame).png") }
		if isVisible == false { return }
		
		sprite.texture = textureWithName("event.noface.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}