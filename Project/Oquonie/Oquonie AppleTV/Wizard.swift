
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Wizard : Event
{
	var spell:Personas!
	var dialogSprite:SKSpriteNode!
	var requiresPillar:Bool = false
	
	init(x:Int,y:Int, spell:Personas!, requiresPillar:Bool = false, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y)
		self.requiresPillar = requiresPillar
		self.spell = spell
		updateSprite("event.\(spell).1.png")
		
		if orientation == Orientation.r { sprite.xScale = -1.0 }
		
		_dialog()
	}
	
	override func onRoomEnter()
	{
		updateDialog()
		
		if requiresPillar == true && player.hasPillar(pillar_necomedre) == false { dialogSprite.texture = textureWithName("test") }
		else if player.persona == spell { dialogSprite.texture = textureWithName("test") }
		else{ dialogSprite.texture = textureWithName("notification.\(spell).png") }
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
		if requiresPillar == true && player.hasPillar(pillar_necomedre) == false { dialog.showModal(dialogs.requiresPillar(),eventName: "\(spell)") ; return }
		if player.persona == spell { dialog.showModal(dialogs.alreadyIsPersona("\(spell)"),eventName: "\(spell)") ; return }
		if spellbook.spells.count == 3 { dialog.showModal(dialogs.spellbookFull(),eventName: "\(spell)") ; return }
		
		if player.hasSpell(self) == true {
			removeSpell()
		}
		else{
			castSpell()
		}
		player.isMoving = false
		updateDialog()
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
	
	override func animateFrame1() { activityFrame = 1 ; updateSprite() }
	override func animateFrame2() { activityFrame = 2 ; updateSprite() }
	override func animateFrame3() { activityFrame = 3 ; updateSprite() }
	
	func updateSprite()
	{
		if isVisible == false && activityFrame != 1 { activityFrame = 1 ; updateSprite("event.\(spell).\(activityFrame).png") }
		if isVisible == false { return }
		updateSprite("event.\(spell).\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}