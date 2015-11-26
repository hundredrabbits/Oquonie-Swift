
//  Created by Devine Lu Linvega on 2015-11-26.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class DoorRed : Door
{
	init(x:Int,y:Int,room:Int,to_x:Int,to_y:Int)
	{
		super.init(x:x,y:x,requirement:nil,room:room,to_x:to_x,to_y:to_y)
		
		self.x = x
		self.y = y
		self.destination = room
		self.to_x = to_x
		self.to_y = to_y
	}
	
	override func onRoomEnter()
	{
		
	}
	
	override func bind(node:Tile)
	{
		target = node
		
		if !player.hasPillar(pillar_necomedre) { target.updateSpriteWithName("wall.gate.red.close.png") ; return }
		if !player.hasPillar(pillar_nephtaline) { target.updateSpriteWithName("wall.gate.red.close.png") ; return }
		if !player.hasPillar(pillar_neomine) { target.updateSpriteWithName("wall.gate.red.close.png") ; return }
		if !player.hasPillar(pillar_nestorine) { target.updateSpriteWithName("wall.gate.red.close.png") ; return }
		if !player.hasPillar(pillar_nemedique) { target.updateSpriteWithName("wall.gate.red.close.png") ; return }
		target.updateSpriteWithName("wall.gate.red.open.png")
	}
	
	override func collide()
	{
		if !player.hasPillar(pillar_necomedre) { dialog.showModal(dialogs.owl(),eventName: "owl") ; return }
		if !player.hasPillar(pillar_nephtaline) { dialog.showModal(dialogs.owl(),eventName: "owl") ; return }
		if !player.hasPillar(pillar_neomine) { dialog.showModal(dialogs.owl(),eventName: "owl") ; return }
		if !player.hasPillar(pillar_nestorine) { dialog.showModal(dialogs.owl(),eventName: "owl") ; return }
		if !player.hasPillar(pillar_nemedique) { dialog.showModal(dialogs.owl(),eventName: "owl") ; return }
		
		if player.isFinishedPart1 == true {
			player.warp(109, to_x: 0, to_y: -1)
		}
		else{
			player.slowWarpTo(self.destination,to_x:self.to_x,to_y:self.to_y)
		}
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}