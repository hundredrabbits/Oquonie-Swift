
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Ramen : Wizard
{
	var isKnown:Bool = false
	var isWizard:Bool = false
	var characterSprite = SKSpriteNode(texture: textureWithName("event.ramen.1.png"), color: UIColor.redColor(), size: CGSize(width: 0,height: 0))
	
	init(x:Int,y:Int,spell:Personas! = nil, isWizard:Bool = false, orientation:Orientation = Orientation.l)
	{
		super.init(x: x, y: y,spell:spell)
		
		sprite.texture = textureWithName("event.ramen.absent.png")
		
		characterSprite = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: sprite.size)
		characterSprite.size = sprite.size
		characterSprite.position = sprite_position
		addChild(characterSprite)
		
		self.isWizard = isWizard
		refreshSprite()
	}
	
	func updateSpell()
	{
		spell = nil
		
		if isWizard == false { return }
		if !player.hasPillar(pillar_nemedique) { return }
		
		if ramen_necomedre.isKnown == true && player.persona == Personas.nephtaline {
			spell = .nemedique
		}
		else if ramen_nephtaline.isKnown == true && player.persona == Personas.neomine {
			spell = .necomedre
		}
		else if ramen_neomine.isKnown == true && player.persona == Personas.nestorine {
			spell = .nephtaline
		}
		else if ramen_neomine.isKnown == true && player.persona == Personas.necomedre {
			spell = .nestorine
		}
	}
	
	override func onRoomEnter()
	{
		updateSpell()
		updateDialog()
		
		characterSprite.alpha = 0
		dialogSprite.alpha = 0
		
		// Lobby
		if isWizard == true && spell != nil {
			characterSprite.alpha = 1
		}
		// In Levels
		else if isWizard == false && isKnown == false {
			characterSprite.alpha = 1
		}
		refreshSprite()
	}
	
	override func updateDialog()
	{
		dialogSprite.alpha = 0
		
		if isWizard == false { return }
		
		if player.hasSpell(self) == false  {
			dialogSprite.runAction(SKAction.fadeAlphaTo(1, duration: 0.1))
			dialogSprite.texture = textureWithName("notification.\(spell).png")
		}
	}
	
	override func bump()
	{
		
	}
	
	override func collide()
	{
		if isWizard == true && player.hasPillar(pillar_nemedique) {
			if ramen_necomedre.isKnown == true && player.persona == Personas.necomedre {
				if player.hasSpell(self) == false { castSpell() } else{ removeSpell() }
			}
			if ramen_nephtaline.isKnown == true && player.persona == Personas.nephtaline {
				if player.hasSpell(self) == false { castSpell() } else{ removeSpell() }
			}
			if ramen_neomine.isKnown == true && player.persona == Personas.neomine {
				if player.hasSpell(self) == false { castSpell() } else{ removeSpell() }
			}
			if ramen_nestorine.isKnown == true && player.persona == Personas.nestorine {
				if player.hasSpell(self) == false { castSpell() } else{ removeSpell() }
			}
			if ramen_nemedique.isKnown == true && player.persona == Personas.nemedique {
				if player.hasSpell(self) == false { castSpell() } else{ removeSpell() }
			}
		}
		else if isWizard == false && isKnown == false {
			let action_fade = SKAction.fadeAlphaTo(0, duration: 1)
			characterSprite.runAction(action_fade)
			isKnown = true
			dialog.showModal(dialogs.ramen(), eventName: "ramen")
		}
		updateDialog()
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	override func refreshSprite()
	{		
		characterSprite.texture = textureWithName("event.ramen.\(activityFrame).png")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}