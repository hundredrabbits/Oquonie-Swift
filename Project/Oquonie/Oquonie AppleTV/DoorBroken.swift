
//  Created by Devine Lu Linvega on 2015-11-26.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class DoorBroken : Door
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
	
	override func bind(node:Tile)
	{
		target = node
		if stage.roomId == 102 {
			if player.isFinishedPart1 == true { target.updateSpriteWithName("wall.18.broken.png") }
			else{ target.updateSpriteWithName("wall.18.png") }
		}
		else if stage.roomId == 3 {
			if player.isFinishedPart1 == true { target.updateSpriteWithName("wall.1.broken.png") }
			else{ target.updateSpriteWithName("wall.1.png") }
		}
		else if stage.roomId == 68 {
			if player.isFinishedPart1 == true { target.updateSpriteWithName("wall.38.png") }
			else{ target.updateSpriteWithName("wall.38.png") }
		}
		else if stage.roomId == 142 {
			if player.isFinishedPart1 == true { target.updateSpriteWithName("wall.99.broken.png") }
			else{ target.updateSpriteWithName("wall.99.png") }
		}
	}
	
	override func collide()
	{
		if player.isFinishedPart1 == false { return }
		player.warp(self.destination, to_x: self.to_x, to_y: self.to_y)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}