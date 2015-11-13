
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Event : SKNode
{
	var sprite:SKSpriteNode!
	var sprite_position:CGPoint = CGPoint(x: 0,y: templates.player.height * 0.335)
	var x:Int!
	var y:Int!
	var target:Tile!
	
	init(x:Int,y:Int)
	{
		super.init()
		
		sprite = SKSpriteNode(texture: nil, color: UIColor.clearColor(), size: templates.player)
		addChild(sprite)
		
		self.x = x
		self.y = y
		sprite.position = sprite_position
		
		position = stage.positionAt(self.x, y: self.y)
		
		let marker = SKShapeNode(circleOfRadius: 5)
		marker.fillColor = UIColor.blueColor()
		marker.strokeColor = UIColor.clearColor()
		addChild(marker)
	}
	
	func bump()
	{
		sprite.position = CGPoint(x:0,y:sprite_position.y + 5)
		sprite.runAction( SKAction.moveToY(sprite_position.y, duration: 0.1) )
	}
	
	func updateSprite(imageName:String)
	{
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		else{
			print("missing: \(imageName)")
		}
		
		sprite.texture = texture
	}
	
	func collide()
	{
		print("hit generic event!")
		player.isMoving = false
	}
	
	func bind(node:Tile)
	{
		print("No bind action")
	}
	
	func remove()
	{
		self.removeFromParent()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}