
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Shark : Event
{
	init(x:Int,y:Int, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y)
		updateSprite("event.shark.1.png")
		
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func collide()
	{
		player.isMoving = false
		if player.hasPillar(pillar_nemedique) == true && player.persona != Personas.necomedre {
			player.transform(Personas.necomedre)
		}
		else if stage.roomId == 102 && player.persona != .necomedre {
			player.transform(Personas.necomedre)
		}
		else {
			dialog.showModal(dialogs.shark(), eventName: "owl")
		}
	}
	
	override func animateFrame1() { activityFrame = 1 ; updateSprite() }
	override func animateFrame2() { activityFrame = 2 ; updateSprite() }
	override func animateFrame3() { activityFrame = 3 ; updateSprite() }
	
	func updateSprite()
	{
		if isVisible == false && activityFrame != 1 { activityFrame = 1 ; sprite.texture = textureWithName("event.shark.\(activityFrame).png") }
		if isVisible == false { return }
		sprite.texture = textureWithName("event.shark.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}