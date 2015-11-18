
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Ramen : Wizard
{
	var isKnown:Bool = false
	var isWizard:Bool = false
	var characterSprite:SKSpriteNode!
	
	init(x:Int,y:Int,spell:Personas! = nil, isWizard:Bool = false, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y,spell:spell)
		
		characterSprite = SKSpriteNode(texture: textureWithName("event.ramen.1.png"), color: UIColor.redColor(), size: sprite.size)
		characterSprite.position = sprite_position
		addChild(characterSprite)
		
		self.isWizard = isWizard
		updateSprite("event.ramen.absent")
	}
	
	override func onRoomEnter()
	{
		updateDialog()
		
		if player.hasPillar(pillar_nemedique) == false {
			characterSprite.alpha = 0
		}
		if wizardSpell() != nil {
			dialogSprite.texture = textureWithName("notification.\(wizardSpell()).png")
		}
	}
	
	func wizardSpell() -> Personas!
	{
		if isWizard == true {
			characterSprite.alpha = 0
			if player.hasPillar(pillar_nemedique) == true {
				if ramen_necomedre.isKnown == true && player.persona == Personas.necomedre { return Personas.nastazie }
				if ramen_nephtaline.isKnown == true && player.persona == Personas.nephtaline { return Personas.nastazie }
				if ramen_neomine.isKnown == true && player.persona == Personas.neomine { return Personas.nastazie }
				if ramen_nestorine.isKnown == true && player.persona == Personas.nestorine { return Personas.nastazie }
				if ramen_nemedique.isKnown == true && player.persona == Personas.nemedique { return Personas.nastazie }
			}
		}
		return nil
	}
	
	
	override func updateDialog()
	{
		if isWizard == true {
			dialogSprite.runAction(SKAction.fadeAlphaTo(0, duration: 0.1))
		}
		else{
			dialogSprite.runAction(SKAction.fadeAlphaTo(1, duration: 0.1))
		}
	}
	
	override func bump()
	{
		
	}
	
	override func collide()
	{
		if isWizard && player.hasPillar(pillar_nemedique) == false {
			return
		}
		
		if isKnown == false && isWizard == false {
			let action_fade = SKAction.fadeAlphaTo(0, duration: 1)
			characterSprite.runAction(action_fade)
			isKnown = true
		}
	}
	
	override func animateFrame1() { activityFrame = 1 ; updateSprite() }
	override func animateFrame2() { activityFrame = 2 ; updateSprite() }
	override func animateFrame3() { activityFrame = 3 ; updateSprite() }
	
	override func updateSprite()
	{
		if isVisible == false && activityFrame != 1 { activityFrame = 1 ; characterSprite.texture = textureWithName("event.ramen.\(activityFrame).png") }
		if isVisible == false { return }
		
		characterSprite.texture = textureWithName("event.ramen.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}