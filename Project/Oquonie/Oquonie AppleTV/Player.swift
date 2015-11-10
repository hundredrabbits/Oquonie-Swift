
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : Event
{
	var isMoving:Bool = false
	
	init()
	{
		super.init(x:0,y:0)
		
		let imageName = "char2.stand.l.f.3.png"
		
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}

		sprite = SKSpriteNode(texture: texture, color: UIColor.clearColor(), size: templates.player)
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
		
		let destination_x:Int = self.x + x
		let destination_y:Int = self.y + y
		let destination_event:Event! = stage.eventAtLocation(destination_x,y:destination_y)
		
		// Look for event
		if destination_event != nil {
			destination_event.collide()
		}
		else if destination_x < 2 && destination_x > -2 && destination_y < 2 && destination_y > -2 {
			self.x = destination_x
			self.y = destination_y
			print("moving: \(x)/\(y) to: \(self.x)/\(self.y)")
			player.runAction(SKAction.moveTo(stage.positionAt(self.x,y:self.y), duration: 0.25), completion: { self.isMoving = false })
		}
		else{
			print("disabled: \(destination_x + x)/\(destination_x + y)")
			self.isMoving = false
		}
	}
	
	override func remove()
	{
		print("cannot remove player")
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}