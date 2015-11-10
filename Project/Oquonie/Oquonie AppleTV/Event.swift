
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Event : SKNode
{
	var sprite:SKSpriteNode!
	var x:Int!
	var y:Int!
	
	init(x:Int,y:Int)
	{
		super.init()
		
		sprite = SKSpriteNode(texture: nil, color: UIColor.clearColor(), size: templates.player)
		addChild(sprite)
		
		self.x = x
		self.y = y
		sprite.position = CGPoint(x: 0,y: 100)
		
		position = stage.positionAt(self.x, y: self.y)
		
		let marker = SKShapeNode(circleOfRadius: 5)
		marker.fillColor = UIColor.blueColor()
		marker.strokeColor = UIColor.clearColor()
		addChild(marker)
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
	
	func remove()
	{
		self.removeFromParent()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}