
//  Created by Devine Lu Linvega on 2015-11-11.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Spellbook : SKNode
{
	var spells:Array<Personas> = []
	
	var spellSlot1:SKSpriteNode!
	var spellSlot2:SKSpriteNode!
	var spellSlot3:SKSpriteNode!
	
	override init()
	{
		super.init()
		
		spellSlot1 = SKSpriteNode(texture: textureWithName("letterSpell1.png"), color: UIColor.redColor(), size: CGSize(width: templates.spell.width, height: templates.spell.height))
		spellSlot1.position = CGPoint(x: CGRectGetMidX(gameScene.frame), y: 0)
		addChild(spellSlot1)
		
		spellSlot2 = SKSpriteNode(texture: textureWithName("letterSpell2.png"), color: UIColor.redColor(), size: CGSize(width: templates.spell.width, height: templates.spell.height))
		spellSlot2.position = CGPoint(x: CGRectGetMidX(gameScene.frame) + (templates.spell.width * 1), y: 0)
		addChild(spellSlot2)
		
		spellSlot3 = SKSpriteNode(texture: textureWithName("letterSpell3.png"), color: UIColor.redColor(), size: CGSize(width: templates.spell.width, height: templates.spell.height))
		spellSlot3.position = CGPoint(x: CGRectGetMidX(gameScene.frame) - (templates.spell.width * 1), y: 0)
		addChild(spellSlot3)
		
		spellSlot1.zPosition = 9000
		spellSlot2.zPosition = 9000
		spellSlot3.zPosition = 9000
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}