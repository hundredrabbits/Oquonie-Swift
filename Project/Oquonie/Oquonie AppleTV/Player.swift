
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : Event
{
	var isMoving:Bool = false
	var isLocked:Bool = false
	var persona:Personas = Personas.necomedre
	var direction:Direction = Direction.f
	var state:States = States.stand
	var collectibles:Array<Event> = []
	var shadow:SKSpriteNode!
	var animationFrame:Int = 0
	
	init()
	{
		super.init(x:0,y:0)
		
		sprite = SKSpriteNode(texture: nil, color: UIColor.clearColor(), size: templates.player)
		sprite.position = sprite_position
		sprite.zPosition = 50
		addChild(sprite)
		
		shadow = SKSpriteNode(texture: textureWithName("fx.shadow.png"), color: UIColor.clearColor(), size: templates.player)
		shadow.position = sprite_position
		shadow.zPosition = 40
		addChild(shadow)
		
		updateSprite()
		
		startActivity()
	}
	
	// MARK: Action -
	
	func move(x:Int, y:Int)
	{
		if isLocked == true { return }
		if isMoving == true { return }
		if dialog.isActive == true { dialog.hideModal() ; return }
		
		updateSpriteStyle(x,y:y)
		action(x,y:y)
		updateSprite()
		startActivity()
	}
	
	func action(x:Int, y:Int)
	{
		let destination_x:Int = self.x + x
		let destination_y:Int = self.y + y
		let destination_event:Event! = stage.eventAtLocation(destination_x,y:destination_y)
		let destination_tile:Tile! = stage.tileAtLocation(destination_x,y:destination_y)
		
		if destination_event != nil {
			destination_event.collide()
			destination_event.bump()
			bump(destination_event)
		}
		else if destination_x < 2 && destination_x > -2 && destination_y < 2 && destination_y > -2 {
			if destination_tile != nil && destination_tile.id == 0 {
				bump()
			}
			else{
				walk(destination_x, destination_y:destination_y)
			}
		}
		else{
			player.bump()
		}
	}
	
	func bump(event:Event)
	{
		if event.position.x < position.x {
			sprite.position = CGPoint(x:5,y:sprite_position.y)
			sprite.runAction( SKAction.moveToX(sprite_position.x, duration: 0.1) )
		}
		else{
			sprite.position = CGPoint(x:-5,y:sprite_position.y)
			sprite.runAction( SKAction.moveToX(sprite_position.x, duration: 0.1) )
		}
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
	
	func lock()
	{
		isLocked = true
	}
	
	func unlock()
	{
		isLocked = false
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
	
	func warp(destination:Int,to_x:Int,to_y:Int)
	{
		player.updatePosition(to_x,y:to_y)
		stage.enter(world.all[destination])
		stage.parallaxTo(stage.positionAt(self.x,y:self.y).x,y:stage.positionAt(self.x,y:self.y).y)
		print("moving: \(destination) -> \(x)/\(y)")
	}
	
	func updateSprite()
	{
		var imageName = "char.\(persona).\(state).\(direction).\(activityFrame).png"
		
		if direction == Direction.b && state == States.stand {
			imageName = "char.\(persona).\(state).\(direction).png"
		}
		if state == States.warp {
			imageName = "char.\(persona).\(state).png"
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
	
	func hasSpell(spell:Wizard) -> Bool
	{
		for _spell in spellbook.spells {
			if spell == _spell { return true}
		}
		return false
	}
	
	func hasPillar(pillar:Pillar) -> Bool
	{
		for collectible in collectibles {
			if pillar == collectible { return true }
		}
		return false
	}
	
	
	// MARK: Animation -
	
	override func fixedUpdate()
	{
	}
	
	// MARK: Transform -
	
	func transform(spell:Personas)
	{
		dialog.showModal(dialogs.transform("\(spell)"),eventName: "\(spell)")
		
		let action_levitate = SKAction.moveToY(sprite_position.y + (templates.floor.height * 0.5), duration: 1)
		action_levitate.timingMode = .EaseIn
		let action_levitate_down = SKAction.moveToY(sprite_position.y + (templates.floor.height * 0.4), duration: 1.0)
		action_levitate_down.timingMode = .EaseIn
		let action_levitate_up = SKAction.moveToY(sprite_position.y + (templates.floor.height * 0.45), duration: 1.5)
		action_levitate_up.timingMode = .EaseIn
		let action_levitate_transform = SKAction.fadeAlphaTo(1, duration: 0.5)
		action_levitate_transform.timingMode = .EaseInEaseOut
		let action_levitate_land = SKAction.moveToY(sprite_position.y, duration: 2)
		action_levitate_land.timingMode = .EaseOut
		
		state = States.warp
		updateSprite()
		
		sprite.runAction(action_levitate, completion: {
			self.sprite.runAction(action_levitate_down, completion: {
				self.sprite.runAction(action_levitate_up, completion: {
					self.persona = spell
					self.updateSprite()
					self.sprite.alpha = 0
					self.sprite.runAction(action_levitate_transform, completion: {
						self.updateSprite()
						self.sprite.runAction(action_levitate_land, completion: {
							self.state = States.stand
							self.orientation = Orientation.l
							self.direction = Direction.f
							self.updateSprite()
						})
					})
				})
			})
		})
		print("transform")
	}
	
	// MARK: Teleport -
	
	func teleportTrigger(room:Int)
	{
		NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "teleport", userInfo: nil, repeats: false)
	}
	
	func teleport()
	{
		levitate()
		stage.teleportOut()
		
		let action_levitate = SKAction.moveToY(sprite_position.y + (templates.floor.height), duration: 4)
		action_levitate.timingMode = .EaseOut
		
		state = .warp
		updateSprite()
	}
	
	func levitate()
	{
		let action_levitate = SKAction.moveToY(sprite_position.y + (templates.floor.height), duration: 4)
		action_levitate.timingMode = .EaseIn
		state = .warp
		updateSprite()
		self.sprite.runAction(action_levitate)
	}
	
	func land()
	{
		let action_land = SKAction.moveToY(self.sprite_position.y, duration: 4)
		action_land.timingMode = .EaseOut
		self.sprite.runAction(action_land, completion:{
			self.state = .stand
			self.direction = .f
			self.updateSprite()
		})
	}
	
	override func animateFrame1() { activityFrame = 1 ; updateSprite() }
	override func animateFrame2() { activityFrame = 2 ; updateSprite() }
	override func animateFrame3() { activityFrame = 3 ; updateSprite() }
	
	override func remove()
	{
		// Disable the removal of the player SKNode
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}