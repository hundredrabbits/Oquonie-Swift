
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : SKNode
{
	var sprite:SKSpriteNode!
	var x:Int = 0
	var y:Int = 0
	var isMoving:Bool = false
	
	override init()
	{
		super.init()
		
		let imageName = "char2.stand.l.f.3.png"
		
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}

		sprite = SKSpriteNode(texture: texture, color: UIColor.purpleColor(), size: templates.player)
		sprite.position = CGPoint(x: 0, y: 100)
		addChild(sprite)
		
		let marker = SKShapeNode(circleOfRadius: 5)
		marker.fillColor = UIColor.redColor()
		marker.strokeColor = UIColor.clearColor()
		addChild(marker)
	}
	
	func move(x:Int, y:Int)
	{
		if isMoving == true { return }
		isMoving = true
		
		if self.x + x <  2 { self.x += x }
		if self.y + y <  2 { self.y += y }
		if self.x + x > -2 { self.x -= x }
		if self.y + y < -2 { self.y -= y }
		player.runAction(SKAction.moveTo(room.positionAt(self.x,y:self.y), duration: 0.5), completion: { self.isMoving = false })
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}