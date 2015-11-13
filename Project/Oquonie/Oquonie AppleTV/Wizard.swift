
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Wizard : Event
{
	var spell:Personas!
	var dialogSprite:SKSpriteNode!
	
	init(x:Int,y:Int, spell:Personas)
	{
		super.init(x: x, y: y)
		self.spell = spell
		updateSprite("event.\(spell).1.png")
		
		_dialog()
	}
	
	override func onRoomEnter()
	{
		updateDialog()
	}
	
	func _dialog()
	{
		dialogSprite = SKSpriteNode(texture: textureWithName("notification.\(spell).png"))
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
	
	override func collide()
	{
		if player.hasSpell(self) == true {
			removeSpell()
		}
		else{
			castSpell()
		}
		player.isMoving = false
		updateDialog()
	}
	
	override func bump()
	{
		sprite.position = CGPoint(x:0,y:sprite_position.y + 5)
		sprite.runAction( SKAction.moveToY(sprite_position.y, duration: 0.1) )
	}
	
	func castSpell()
	{
		spellbook.addSpell(self)
	}
	
	func removeSpell()
	{
		spellbook.removeSpell(self)
	}
	
	func updateDialog()
	{
		if player.hasSpell(self) == true {
			dialogSprite.runAction(SKAction.fadeAlphaTo(0, duration: 0.1))
		}
		else{
			dialogSprite.runAction(SKAction.fadeAlphaTo(1, duration: 0.1))
		}
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}