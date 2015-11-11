
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : Event
{
	var isMoving:Bool = false
	var persona:Personas = Personas.necomedre
	
	init()
	{
		super.init(x:0,y:0)
		
		let imageName = "char.necomedre.stand.f.1.png"
		
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
	
	func updatePosition(x:Int,y:Int)
	{
		self.x = x
		self.y = y
		self.position = stage.positionAt(self.x,y:self.y)
	}
	
	override func remove()
	{
		// Disable the removal of the player SKNode
	}
	
	func warp(destination:Int,to_x:Int,to_y:Int)
	{
		stage.enter(world.all[destination])
		player.updatePosition(to_x,y:to_y)
		
		print("moving: \(destination) -> \(x)/\(y)")
	}
	
	override func update()
	{
		print("test")
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}