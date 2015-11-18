
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Speaker : Event
{
	init(x:Int,y:Int, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y)
		
		updateSprite("event.music.1.png")
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func collide()
	{
		if player.hasMusic == true {
			turnOff()
		}
		else{
			turnOn()
		}
		player.isMoving = false
		updateSprite()
	}
	
	func turnOn()
	{
		player.hasMusic = true
		dialog.showModal(dialogs.music(true), eventName: "music")
	}
	
	func turnOff()
	{
		player.hasMusic = false
		dialog.showModal(dialogs.music(false), eventName: "music")
	}
	
	override func animateFrame1() { activityFrame = 1 ; updateSprite() }
	override func animateFrame2() { activityFrame = 2 ; updateSprite() }
	override func animateFrame3() { activityFrame = 3 ; updateSprite() }
	
	func updateSprite()
	{
		if isVisible == true && player.hasMusic == true { sprite.texture = textureWithName("event.music.off.png") ; return }
		if isVisible == false && activityFrame != 1 { activityFrame = 1 ; sprite.texture = textureWithName("event.music.\(activityFrame).png") ; return }
		if isVisible == false { return }
		sprite.texture = textureWithName("event.music.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}