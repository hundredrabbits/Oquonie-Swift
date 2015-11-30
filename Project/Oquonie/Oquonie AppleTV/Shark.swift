
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
		audio.play(.dialog, name: "shark")
		
		player.isMoving = false
		if player.hasPillar(pillar_nemedique) == true && player.persona != Personas.necomedre {
			player.transform(Personas.necomedre)
			spellbook.clearSpells()
			spellbook.update()
		}
		else if stage.roomId == 102 && player.persona != .necomedre {
			player.transform(Personas.necomedre)
			spellbook.clearSpells()
			spellbook.update()
		}
		else {
			dialog.showModal(dialogs.shark(), eventName: "owl")
		}
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	override func refreshSprite()
	{
		sprite.texture = textureWithName("event.shark.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}