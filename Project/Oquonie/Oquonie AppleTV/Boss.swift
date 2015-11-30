
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Boss : Event
{
	var dialogSprite:SKSpriteNode!
	
	init(x:Int,y:Int, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y)
		updateSprite("event.boss.1.png")
		
		if orientation == Orientation.r { sprite.xScale = -1.0 }
		
		_dialog()
	}
	
	override func collide()
	{
		audio.play(.dialog, name: "noface")
		
		dialogSprite.alpha = 0
		
		player.transform(.necomedre)
		stage.destroyTrigger()
	}
	
	func _dialog()
	{
		dialogSprite = SKSpriteNode(texture: textureWithName("notification.document.png"))
		dialogSprite.size = templates.player
		dialogSprite.position = CGPoint(x: 0,y: templates.player.height/2)
		addChild(dialogSprite)
		
		let verticalPos = (templates.player.height/2)
		let move_up   = SKAction.moveTo(CGPoint(x: 0,y: verticalPos), duration: 1.5)
		let move_down = SKAction.moveTo(CGPoint(x: 0,y: verticalPos + 5), duration: 1.5)
		let sequence  = SKAction.sequence([move_up,move_down])
		let test = SKAction.repeatActionForever(sequence)
		
		dialogSprite.runAction(test)
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	override func refreshSprite()
	{
		sprite.texture = textureWithName("event.boss.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}