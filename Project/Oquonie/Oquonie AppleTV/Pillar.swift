
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class Pillar : Event
{
	var display:Pillar!
	var persona:Personas!
	
	init(x:Int,y:Int, display:Pillar! = nil, persona:Personas! = nil)
	{
		super.init(x: x, y: y)
		
		self.display = display
		self.persona = persona
		
		updateSprite("event.pillar.base.png")
	}
	
	override func onRoomEnter()
	{
		if display != nil {
			print(display)
			if player.hasPillar(display) { updateSprite("event.pillar.active.1.png") }
			else{ updateSprite("event.pillar.base.png") }
		}
		else if stage.roomId == 103 && player.hasPillar(pillar_nemedique) { updateSprite("event.pillar.gone.png") }
		else {
			 updateSprite("event.pillar.png")
		}
	}
	
	override func collide()
	{
		print("touched pillar(\(player.hasPillar(self)))")
		
		if display != nil {
			dialog.showModal(dialogs.pillarSocket(display), eventName: "owl")
			return
		}
		
		if player.hasPillar(self) { player.walk(x, destination_y: y) } ;
		
		if !player.hasPillar(self) {
			collect()
		}
		else{
			if stage.roomId == Waypoints.nephtaline_pillar.rawValue { player.teleportTrigger(1) }
			else if stage.roomId == Waypoints.nestorine_pillar.rawValue { player.teleportTrigger(7) }
			else if stage.roomId == Waypoints.neomine_pillar.rawValue { player.teleportTrigger(3) }
			else if stage.roomId == Waypoints.nemedique_pillar.rawValue { player.teleportTrigger(9) }
			else if stage.roomId == Waypoints.nastazie_pillar.rawValue { player.teleportTrigger(14) }
			else{ print("!!!!\(self.persona)") }
		}
	}

	override func bump()
	{
	
	}
	
	func collect()
	{
		player.collectibles.append(self)
		updateSprite("event.pillar.gone.png")
	}
	
	override func animateFrame1() { activityFrame = 1 ; updateSpriteReview() }
	override func animateFrame2() { activityFrame = 2 ; updateSpriteReview() }
	override func animateFrame3() { activityFrame = 3 ; updateSpriteReview() }
	
	func updateSpriteReview()
	{
		if display == nil { return }
		if player.hasPillar(display) == false { return }
		if isVisible == false && activityFrame != 1 { activityFrame = 1 ; sprite.texture = textureWithName("event.pillar.active.\(activityFrame).png") }
		if isVisible == false { return }
		sprite.texture = textureWithName("event.pillar.active.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}