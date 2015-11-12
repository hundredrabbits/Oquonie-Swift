
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SceneKit
import Foundation

class Wizard : Event
{
	var spell:Personas!
	
	init(x:Int,y:Int, spell:Personas)
	{
		super.init(x: x, y: y)
		
		self.spell = spell
		
		updateSprite("event.\(spell).1.png")
	}
	
	override func collide()
	{
		print("touched wizard: \(self.spell)")
		
		if player.hasSpell(self) == true {
			removeSpell()
		}
		else{
			castSpell()
		}
		
		player.isMoving = false
	}
	
	func castSpell()
	{
		print("cast spell")
		spellbook.addSpell(self)
	}
	
	func removeSpell()
	{
		print("remove spell")		
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}