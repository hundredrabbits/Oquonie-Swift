
//  Created by Devine Lu Linvega on 2015-11-11.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Spellbook : SKNode
{
	var spells:Array<Wizard> = []
	
	var spellSlot1:SKSpriteNode!
	var spellSlot2:SKSpriteNode!
	var spellSlot3:SKSpriteNode!
	
	var activity:Timer!
	
	override init()
	{
		super.init()
		
		spellSlot1 = SKSpriteNode(texture: textureWithName("letter.spell.blank.png"), color: SKColor.red, size: CGSize(width: templates.spell.width, height: templates.spell.height))
		spellSlot1.position = CGPoint(x: -(templates.spell.width), y: 0)
		addChild(spellSlot1)
		
		spellSlot2 = SKSpriteNode(texture: textureWithName("letter.spell.blank.png"), color: SKColor.red, size: CGSize(width: templates.spell.width, height: templates.spell.height))
		spellSlot2.position = CGPoint(x: 0, y: 0)
		addChild(spellSlot2)
		
		spellSlot3 = SKSpriteNode(texture: textureWithName("letter.spell.blank.png"), color: SKColor.red, size: CGSize(width: templates.spell.width, height: templates.spell.height))
		spellSlot3.position = CGPoint(x: (templates.spell.width), y: 0)
		addChild(spellSlot3)
		
		spellSlot1.zPosition = 9000
		spellSlot2.zPosition = 9000
		spellSlot3.zPosition = 9000
		
		startActivity()
	}
	
	func startActivity()
	{
		if activity != nil { activity.invalidate() }
		activity = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(Spellbook.closeSpellbook), userInfo: nil, repeats: false)
	}
	
	func closeSpellbook()
	{
		if spells.count != 0 { return }
		
		spellSlot1.run(SKAction.fadeAlpha(to: 0, duration: 0.15))
		spellSlot2.run(SKAction.fadeAlpha(to: 0, duration: 0.20))
		spellSlot3.run(SKAction.fadeAlpha(to: 0, duration: 0.25))
		
		spellSlot1.run(SKAction.move(to: CGPoint(x: -(templates.spell.width * 1), y: -10), duration: 0.15))
		spellSlot2.run(SKAction.move(to: CGPoint(x: 0, y: -10), duration: 0.20))
		spellSlot3.run(SKAction.move(to: CGPoint(x: (templates.spell.width * 1), y: -10), duration: 0.25))
	}
	
	func update()
	{
		spellSlot1.run(SKAction.move(to: CGPoint(x: -(templates.spell.width * 1), y: -10), duration: 0.15), completion: {
			self.spellSlot1.texture = self.spells.count > 0 ? textureWithName("letter.spell.\(self.spells[0].spell!).png") : textureWithName("letter.spell.blank.png")
			self.spellSlot1.run(SKAction.move(to: CGPoint(x: -(templates.spell.width), y: 0), duration: 0.15))
			self.spellSlot1.alpha = 0
			self.spellSlot1.run(SKAction.fadeAlpha(to: 1, duration: 0.15))
		})
		spellSlot2.run(SKAction.move(to: CGPoint(x: 0, y: -10), duration: 0.20), completion: {
			self.spellSlot2.texture = self.spells.count > 1 ? textureWithName("letter.spell.\(self.spells[1].spell!).png") : textureWithName("letter.spell.blank.png")
			self.spellSlot2.run(SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0.20))
			self.spellSlot2.alpha = 0
			self.spellSlot2.run(SKAction.fadeAlpha(to: 1, duration: 0.20))
		})
		spellSlot3.run(SKAction.move(to: CGPoint(x: (templates.spell.width * 1), y: -10), duration: 0.25), completion: {
			self.spellSlot3.texture = self.spells.count > 2 ? textureWithName("letter.spell.\(self.spells[2].spell!).png") : textureWithName("letter.spell.blank.png")
			self.spellSlot3.run(SKAction.move(to: CGPoint(x: (templates.spell.width), y: 0), duration: 0.25))
			self.spellSlot3.alpha = 0
			self.spellSlot3.run(SKAction.fadeAlpha(to: 1, duration: 0.25))
		})
	}
	
	func useSpells()
	{
		player.transform(spells[0].spell)
		Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(Spellbook.clearSpells), userInfo: nil, repeats: false)	
	}
	
	func clearSpells()
	{
		if spells.first != nil { spells.first!.removeSpell() }
		if spells.first != nil { spells.first!.removeSpell() }
		if spells.first != nil { spells.first!.removeSpell() }
		audio.play(.interface, name: "spellbook.remove")
	}
	
	func addSpell(_ spell:Wizard)
	{
		spells.append(spell)
		if hasSequence() == true {
			useSpells()
		}
		update()
		startActivity()
		
		audio.play(.interface, name: "spellbook.add")
	}
	
	func removeSpell(_ spell:Wizard)
	{
		var newSpellbook:Array<Wizard> = []
		for _spell in spells {
			if spell == _spell { continue }
			newSpellbook.append(_spell)
		}
		spells = newSpellbook
		update()
		startActivity()
	}
	
	func hasSequence() -> Bool
	{
		if spells.count != 3 { return false }
		
		if spells[0].spell == spells[1].spell && spells[1].spell == spells[2].spell {
			return true
		}
		
		return false
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}
