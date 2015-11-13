
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
		
		addDialog()
	}
	
	override func onRoomEnter()
	{
		updateDialog()
	}
	
	func addDialog()
	{
		let imageName = "notification.blank.png"
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		
		dialogSprite = SKSpriteNode(texture: texture)
		dialogSprite.size = templates.player
		dialogSprite.position = CGPoint(x: 0,y: templates.player.height/2)
		addChild(dialogSprite)
	}
	
	override func collide()
	{
		print("Collided with \(spell)")
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
		print("cast spell")
		spellbook.addSpell(self)
	}
	
	func removeSpell()
	{
		print("remove spell")
		spellbook.removeSpell(self)
	}
	
	func updateDialog()
	{
		dialogSprite.alpha = (player.hasSpell(self) == true) ? 0 : 1
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}