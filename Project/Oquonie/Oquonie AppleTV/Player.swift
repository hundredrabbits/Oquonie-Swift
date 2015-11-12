
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : Event
{
	var isMoving:Bool = false
	var persona:Personas = Personas.necomedre
	var orientation:Orientation = Orientation.l
	var direction:Direction = Direction.f
	var state:States = States.stand
	
	init()
	{
		super.init(x:0,y:0)
		
		sprite = SKSpriteNode(texture: nil, color: UIColor.clearColor(), size: templates.player)
		sprite.position = CGPoint(x: 0, y: 100)
		addChild(sprite)
		
		let marker = SKShapeNode(circleOfRadius: 5)
		marker.fillColor = UIColor.redColor()
		marker.strokeColor = UIColor.clearColor()
		addChild(marker)
		
		updateSprite()
	}
	
	func move(x:Int, y:Int)
	{
		if isMoving == true { return }
		
		updateSpriteStyle(x,y:y)
		action(x,y:y)
		updateSprite()
	}
	
	func action(x:Int, y:Int)
	{
		let destination_x:Int = self.x + x
		let destination_y:Int = self.y + y
		let destination_event:Event! = stage.eventAtLocation(destination_x,y:destination_y)
		
		// Look for event
		if destination_event != nil {
			destination_event.collide()
			bump()
		}
		else if destination_x < 2 && destination_x > -2 && destination_y < 2 && destination_y > -2 {
			walk(destination_x, destination_y:destination_y)
		}
		else{
			stand()
		}
	}
	
	func bump()
	{
		print("bump!")
	}
	
	func walk(destination_x:Int, destination_y:Int)
	{
		isMoving = true
		self.state = States.walk
		updateSprite()
		self.x = destination_x
		self.y = destination_y
		print("moving: \(x)/\(y) to: \(self.x)/\(self.y)")
		
		let action_move = SKAction.moveTo(stage.positionAt(self.x,y:self.y), duration: 0.25)
		action_move.timingMode = .EaseInEaseOut
		player.runAction(action_move, completion: { self.stand() })
		stage.parallaxTo(stage.positionAt(self.x,y:self.y).x,y:stage.positionAt(self.x,y:self.y).y)
	}
	
	func stand()
	{
		print("stand")
		self.isMoving = false
		self.state = States.stand
		updateSprite()
	}
	
	func updateSpriteStyle(x:Int, y:Int)
	{
		// Direction
		if x > 0 || y > 0 { direction = Direction.b }
		else if x < 0 || y < 0 { direction = Direction.f }
		
		// Orientation
		if x > 0 || y < 0 { orientation = Orientation.r }
		else if x < 0 || y > 0 { orientation = Orientation.l }
		
		// Orientation Fix
		
		if orientation == Orientation.r { sprite.xScale = -1.0 }
		else{ sprite.xScale = 1.0 }
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
		player.updatePosition(to_x,y:to_y)
		stage.enter(world.all[destination])
		stage.parallaxTo(stage.positionAt(self.x,y:self.y).x,y:stage.positionAt(self.x,y:self.y).y)
		print("moving: \(destination) -> \(x)/\(y)")
	}
	
	func updateSprite()
	{
		var imageName = "char.necomedre.\(state).\(direction).1.png"
		
		if direction == Direction.b && state == States.stand {
			imageName = "char.necomedre.\(state).\(direction).png"
		}
		
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
	
	override func fixedUpdate()
	{
	}
	
	func hasSpell(spell:Wizard) -> Bool
	{
		for spell in spellbook.spells {
			if spell == spell { return true}
		}
		return false
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}