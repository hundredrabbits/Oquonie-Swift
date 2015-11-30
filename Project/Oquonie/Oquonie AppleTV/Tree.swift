
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Tree : Event
{
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
		updateSprite("event.tree.1.png")
	}
	
	override func onRoomEnter()
	{
		var pillarsCount = 0
		
		if player.hasPillar(pillar_necomedre) { pillarsCount += 1 }
		if player.hasPillar(pillar_nephtaline) { pillarsCount += 1 }
		if player.hasPillar(pillar_neomine) { pillarsCount += 1 }
		if player.hasPillar(pillar_nestorine) { pillarsCount += 1 }
		if player.hasPillar(pillar_nemedique) { pillarsCount += 1 }
		
		if pillarsCount == 0 { updateSprite(nil) }
		else if pillarsCount == 1 { updateSprite("event.tree.1.png") }
		else if pillarsCount == 2 { updateSprite("event.tree.2.png") }
		else if pillarsCount == 3 { updateSprite("event.tree.3.png") }
		else if pillarsCount == 4 { updateSprite("event.tree.4.png") }
		else if pillarsCount == 5 { updateSprite("event.tree.5.png") }
	}
	
	override func collide()
	{
		audio.play(.dialog, name: "owl")
		
		var pillarsCount = 0
		if player.hasPillar(pillar_necomedre) { pillarsCount += 1 }
		if player.hasPillar(pillar_nephtaline) { pillarsCount += 1 }
		if player.hasPillar(pillar_neomine) { pillarsCount += 1 }
		if player.hasPillar(pillar_nestorine) { pillarsCount += 1 }
		if player.hasPillar(pillar_nemedique) { pillarsCount += 1 }
		
		if pillarsCount == 0 {
			player.walk(0, destination_y: 0)
		}
		else{
			dialog.showModal(dialogs.tree(pillarsCount), eventName:"owl")
		}
		
		print("Hit blocker")
		player.isMoving = false
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}