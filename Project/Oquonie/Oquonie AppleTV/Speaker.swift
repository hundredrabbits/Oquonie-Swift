
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Speaker : Event
{
	var spriteName:String!
	
	init(x:Int,y:Int, orientation:Orientation = Orientation.l, special:Bool = false)
	{
		super.init(x: x, y: y)
		
		spriteName = special == true ? "radio" : "music"
		
		refreshSprite()
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func collide()
	{
		audio.play(.dialog, name: "speaker")
		
		if player.isListening == true {
			turnOff()
		}
		else{
			turnOn()
		}
		player.isMoving = false
		refreshSprite()
	}
	
	func turnOn()
	{
		dialog.showModal(dialogs.music(true), eventName: spriteName)
		audio.unMute()
	}
	
	func turnOff()
	{
		dialog.showModal(dialogs.music(false), eventName: spriteName)
		audio.mute()
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	override func refreshSprite()
	{
		if player.isListening == true { sprite.texture = textureWithName("event.\(spriteName).off.png") ; return }
		sprite.texture = textureWithName("event.\(spriteName).\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}