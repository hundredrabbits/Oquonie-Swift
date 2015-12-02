
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : Event
{
	var hasOverlay:Bool = false
	var hasMusic:Bool = true
	var isCompleted:Bool = false
	var isMoving:Bool = false
	var isLocked:Bool = false
	var isListening:Bool = true
	var animationFrame:Int = 0
	var teleport_room:Int!
	var teleport_x:Int!
	var teleport_y:Int!
	
	var persona:Personas = Personas.necomedre
	var direction:Direction = Direction.f
	var state:States = States.stand
	var shadow:SKSpriteNode!
	
	init()
	{
		super.init(x:0,y:0)
		
		sprite = SKSpriteNode(texture: nil, color: SKColor.clearColor(), size: templates.player)
		sprite.position = sprite_position
		addChild(sprite)
		
		shadow = SKSpriteNode(texture: textureWithName("char.shadow.png"), color: SKColor.clearColor(), size: templates.player)
		shadow.position = sprite_position
		shadow.zPosition = 40
		addChild(shadow)
		
		refreshSprite()
		
		startActivity()
	}
	
	// MARK: Action -
	
	func move(x:Int, y:Int)
	{
		if isLocked == true { return }
		if isMoving == true { return }
		if dialog.isActive == true { dialog.hideModal() ; return }
		if hasOverlay == true { hideOverlay() ; return }
		
		updateSpriteStyle(x,y:y)
		action(x,y:y)
		refreshSprite()
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
			audio.play(.effect, name: "bump.2")
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
		audio.play(.effect, name: "bump.1")
	}
	
	func walk(destination_x:Int, destination_y:Int)
	{
		isMoving = true
		self.state = States.walk
		refreshSprite()
		self.x = destination_x
		self.y = destination_y
		print("  MOVE - \(self.x),\(self.y)")
		
		let action_move = SKAction.moveTo(stage.positionAt(self.x,y:self.y), duration: 0.3)
		action_move.timingMode = .EaseInEaseOut
		player.runAction(action_move, completion: { self.stand() })
		stage.parallaxTo(stage.positionAt(self.x,y:self.y).x,y:stage.positionAt(self.x,y:self.y).y)
		
		player.zPosition = stage.eventDepthAtPosition(destination_x, y: destination_y)
		audio.play(.effect, name: "walk")
	}
	
	func stand()
	{
		print("  STOP")
		self.isMoving = false
		self.state = States.stand
		refreshSprite()
	}
	
	func lock()
	{
		print("> LOCK - Locked!")
		isLocked = true
	}
	
	func unlock()
	{
		print("> LOCK - Unlocked!")
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
		stage.enter(destination)
		stage.parallaxTo(stage.positionAt(self.x,y:self.y).x,y:stage.positionAt(self.x,y:self.y).y)
		print("! MOVE - \(destination) -> \(x)/\(y)")
	}
	
	func slowWarpTo(roomId:Int,to_x:Int,to_y:Int)
	{
		player.lock()
		sprite.runAction(SKAction.fadeAlphaTo(0, duration: 2),completion:{
			stage.fadeTransition(roomId,to_x:to_x,to_y:to_y)
		})
		audio.play(.effect, name: "warp")
	}
	
	override func refreshSprite()
	{
		if state == States.walk && activityFrame == 3 { activityFrame = 2 }
		
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
			print("!ERROR - Player.unknown: \(imageName)")
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
		return pillar.isKnown
	}
	
	// MARK: Animation -
	
	override func fixedUpdate()
	{
		player.zPosition = stage.eventDepthAtPosition(x, y: y)
	}
	
	// MARK: Transform -
	
	func transform(spell:Personas)
	{
		audio.play(.effect, name: "transform")
		lock()
		
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
		refreshSprite()
		
		sprite.runAction(action_levitate, completion: {
			self.sprite.runAction(action_levitate_down, completion: {
				self.sprite.runAction(action_levitate_up, completion: {
					self.persona = spell
					self.refreshSprite()
					self.sprite.alpha = 0
					stage.onPlayerTransformed()
					self.sprite.runAction(action_levitate_transform, completion: {
						self.refreshSprite()
						stage.showFx("fx.1.vertical.png", duration:1)
						self.sprite.runAction(action_levitate_land, completion: {
							self.state = States.stand
							self.orientation = Orientation.l
							self.direction = Direction.f
							self.refreshSprite()
							self.unlock()
						})
					})
				})
			})
		})
	}
	
	// MARK: Teleport -
	
	func teleportTrigger(room:Int,to_x:Int,to_y:Int)
	{
		teleport_room = room
		teleport_x = to_x
		teleport_y = to_y
		player.lock()
		NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "teleport", userInfo: nil, repeats: false)
	}
	
	func teleport()
	{
		levitate()
		stage.teleportOut(teleport_room, to_x:teleport_x, to_y:teleport_y)
		
		let action_levitate = SKAction.moveToY(sprite_position.y + (templates.floor.height), duration: 4)
		action_levitate.timingMode = .EaseOut
		
		state = .warp
		refreshSprite()
	}
	
	func appear()
	{
		audio.play(.effect, name: "warp")
		
		player.lock()
		self.sprite.alpha = 0
		self.shadow.alpha = 0
		state = .warp
		refreshSprite()
		sprite.position = CGPoint(x: self.sprite_position.x, y: self.sprite_position.y + (templates.floor.height))
		
		let action_land = SKAction.moveToY(self.sprite_position.y, duration: 4)
		action_land.timingMode = .EaseOut
		self.sprite.runAction(action_land, completion:{
			self.state = .stand
			self.direction = .f
			self.refreshSprite()
			player.unlock()
			audio.play(.effect, name: "bump.2")
		})
		self.shadow.runAction(SKAction.fadeAlphaTo(1, duration: 2))
		self.sprite.runAction(SKAction.fadeAlphaTo(1, duration: 1))
	}
	
	func levitate()
	{
		let action_levitate = SKAction.moveToY(sprite_position.y + (templates.floor.height), duration: 4)
		action_levitate.timingMode = .EaseIn
		state = .warp
		refreshSprite()
		self.sprite.runAction(action_levitate)
		
		self.shadow.runAction(SKAction.fadeAlphaTo(0, duration: 2))
	}
	
	func land()
	{
		let action_land = SKAction.moveToY(self.sprite_position.y, duration: 4)
		action_land.timingMode = .EaseOut
		self.sprite.runAction(action_land, completion:{
			self.state = .stand
			self.direction = .f
			self.refreshSprite()
			player.unlock()
		})
		self.shadow.runAction(SKAction.fadeAlphaTo(1, duration: 2))
	}
	
	override func animateFrame1() { activityFrame = 1 ; refreshSprite() }
	override func animateFrame2() { activityFrame = 2 ; refreshSprite() }
	override func animateFrame3() { activityFrame = 3 ; refreshSprite() }
	
	// MARK: Overlay -
	
	func showOverlay(textureName:String)
	{
		hasOverlay = true
		overlay.alpha = 0
		overlay_image.alpha = 0
		
		overlay_image.texture = textureWithName(textureName)
		
		overlay.runAction(SKAction.fadeAlphaTo(1, duration: 0.25), completion:{
			overlay_image.runAction(SKAction.fadeAlphaTo(1, duration: 0.25))
		})
	}
	func hideOverlay()
	{
		overlay_image.runAction(SKAction.fadeAlphaTo(0, duration: 0.25), completion:{
			overlay.runAction(SKAction.fadeAlphaTo(0, duration: 0.25), completion:{
				self.hasOverlay = false
			})
		})
	}
	
	override func remove()
	{
		// Disable the removal of the player SKNode
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}