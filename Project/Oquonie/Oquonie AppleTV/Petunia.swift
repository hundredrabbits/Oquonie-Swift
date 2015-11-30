
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Petunia : Event
{
	override init(x:Int,y:Int)
	{
		super.init(x: x, y: y)
	}
	
	override func collide()
	{
		let value1 = Int(randomBetweenNumbers(2,secondNum: 50))
		let value2 = Int(randomBetweenNumbers(2,secondNum: 50))
		let value3 = Int(randomBetweenNumbers(2,secondNum: 50))
		
		let value4 = Int(randomBetweenNumbers(1,secondNum: 40))
		let value5 = Int(randomBetweenNumbers(1,secondNum: 40))
		
		stage.floor00.texture = textureWithName("tile.\(value1).png")
		
		stage.floor10.texture = textureWithName("tile.\(value2).png")
		stage.floore0.texture = textureWithName("tile.\(value2).png")
		stage.floor01.texture = textureWithName("tile.\(value2).png")
		stage.floor0e.texture = textureWithName("tile.\(value2).png")
		
		stage.floor11.texture = textureWithName("tile.\(value3).png")
		stage.flooree.texture = textureWithName("tile.\(value3).png")
		stage.floore1.texture = textureWithName("tile.\(value3).png")
		stage.floor1e.texture = textureWithName("tile.\(value3).png")
		
		stage.wall1.texture = textureWithName("wall.\(value4).png")
		stage.wall2.texture = textureWithName("wall.\(value5).png")
		stage.wall3.texture = textureWithName("wall.\(value4).png")
		stage.wall4.texture = textureWithName("wall.\(value4).png")
		stage.wall5.texture = textureWithName("wall.\(value5).png")
		stage.wall6.texture = textureWithName("wall.\(value4).png")
		
		player.isMoving = false
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	override func refreshSprite()
	{
		sprite.texture = textureWithName("event.petunia.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}