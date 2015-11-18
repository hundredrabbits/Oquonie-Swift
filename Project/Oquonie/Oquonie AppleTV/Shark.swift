
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Shark : Event
{
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
		updateSprite("event.shark.1.png")
	}
	
	override func collide()
	{
		player.isMoving = false
		dialog.showModal(dialogs.shark(), eventName: "owl")
		if player.hasPillar(pillar_nemedique) == true && player.persona != Personas.necomedre { player.transform(Personas.necomedre) }
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