
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Stage : SKNode
{
	let wall1:Tile!
	let wall2:Tile!
	let wall3:Tile!
	let wall4:Tile!
	let wall5:Tile!
	let wall6:Tile!
	
	var floor11:Tile!
	var floor10:Tile!
	var floor01:Tile!
	var floor1e:Tile!
	var floor00:Tile!
	var floore1:Tile!
	var floor0e:Tile!
	var floore0:Tile!
	var flooree:Tile!
	
	let step1:Tile!
	let step2:Tile!
	let step3:Tile!
	let step4:Tile!
	let step5:Tile!
	let step6:Tile!
	
	let events_root = SKNode()
	var room:Room!
	var room_root = SKNode()
	
	override init()
	{
		wall3 = Tile(sprite: Types.wall, position: CGPoint(x: -templates.wall.width * 0.5, y: templates.wall.height * 0.77), size: templates.wall)
		wall4 = Tile(sprite: Types.wall, position: CGPoint(x:  templates.wall.width * 0.5, y: templates.wall.height * 0.77), size: templates.wall)
		wall2 = Tile(sprite: Types.wall, position: CGPoint(x: -templates.wall.width, y: templates.wall.height * 0.60), size: templates.wall)
		wall5 = Tile(sprite: Types.wall, position: CGPoint(x:  templates.wall.width, y: templates.wall.height * 0.60), size: templates.wall)
		wall1 = Tile(sprite: Types.wall, position: CGPoint(x: -templates.wall.width * 1.5, y: templates.wall.height * 0.42), size: templates.wall)
		wall6 = Tile(sprite: Types.wall, position: CGPoint(x:  templates.wall.width * 1.5, y: templates.wall.height * 0.42), size: templates.wall)
		
		step1 = Tile(sprite: Types.step, position: CGPoint(x: -templates.step.width * 1.5, y: -templates.step.height * 0.35), size: templates.step)
		step2 = Tile(sprite: Types.step, position: CGPoint(x: -templates.step.width, y: -templates.step.height * 0.7), size: templates.step)
		step3 = Tile(sprite: Types.step, position: CGPoint(x: -templates.step.width * 0.5, y: -templates.step.height), size: templates.step)
		step4 = Tile(sprite: Types.step, position: CGPoint(x:  templates.step.width * 0.5, y: -templates.step.height), size: templates.step)
		step5 = Tile(sprite: Types.step, position: CGPoint(x:  templates.step.width, y: -templates.step.height * 0.7), size: templates.step)
		step6 = Tile(sprite: Types.step, position: CGPoint(x:  templates.step.width * 1.5, y: -templates.step.height * 0.35), size: templates.step)
		
		super.init()
		
		floor11 = Tile(sprite: Types.tile, position:positionAt(1,y: 1), size: templates.floor)
		floor01 = Tile(sprite: Types.tile, position:positionAt(0,y: 1), size: templates.floor)
		floor10 = Tile(sprite: Types.tile, position:positionAt(1,y: 0), size: templates.floor)
		floore1 = Tile(sprite: Types.tile, position:positionAt(-1,y: 1), size: templates.floor)
		floor00 = Tile(sprite: Types.tile, position:positionAt(0,y: 0), size: templates.floor)
		floor1e = Tile(sprite: Types.tile, position:positionAt(1,y: -1), size: templates.floor)
		floore0 = Tile(sprite: Types.tile, position:positionAt(-1,y: 0), size: templates.floor)
		floor0e = Tile(sprite: Types.tile, position:positionAt(0,y: -1), size: templates.floor)
		flooree = Tile(sprite: Types.tile, position:positionAt(-1,y: -1), size: templates.floor)
		
		start()
	}
	
	func start()
	{
		room_root.addChild(wall3)
		room_root.addChild(wall4)
		room_root.addChild(wall2)
		room_root.addChild(wall5)
		room_root.addChild(wall1)
		room_root.addChild(wall6)
		
		room_root.addChild(floor11)
		room_root.addChild(floor10)
		room_root.addChild(floor01)
		room_root.addChild(floor1e)
		room_root.addChild(floor00)
		room_root.addChild(floore1)
		room_root.addChild(floore0)
		room_root.addChild(floor0e)
		room_root.addChild(flooree)
		
		floor11.zPosition = -5
		floor10.zPosition = -3
		floor01.zPosition = -3
		floor10.zPosition =  0
		floor01.zPosition =  0
		floor01.zPosition =  0
		floore0.zPosition =  3
		floor0e.zPosition =  3
		flooree.zPosition =  5
		
		room_root.addChild(step1)
		room_root.addChild(step6)
		room_root.addChild(step2)
		room_root.addChild(step5)
		room_root.addChild(step3)
		room_root.addChild(step4)
		
		wall1.zPosition = -2
		wall2.zPosition = -4
		wall3.zPosition = -6
		wall4.zPosition = -6
		wall5.zPosition = -4
		wall6.zPosition = -2
		
		step1.zPosition =  2
		step2.zPosition =  4
		step3.zPosition =  6
		step4.zPosition =  6
		step5.zPosition =  4
		step6.zPosition =  2
		
		wall1.xScale = -1
		wall2.xScale = -1
		wall3.xScale = -1
		step4.xScale = -1
		step5.xScale = -1
		step6.xScale = -1
		
		addChild(room_root)
		
		addChild(events_root)
		events_root.zPosition = 900
	}
	
	func enter(room:Room)
	{
		self.room = room
		updateTiles()
		removeEvents()
		
		for event in room.events {
			addEvent(event)
		}
		
		for node in room_root.children {
			node.onRoomEnter()
		}
		
		for node in events_root.children {
			node.onRoomEnter()
		}
		
		// Bind sprites to events
		for event in events_root.children {
			let event = event as! Event
			if event.x == -1 && event.y ==  2 { event.bind(wall1) }
			if event.x ==  0 && event.y ==  2 { event.bind(wall2) }
			if event.x ==  1 && event.y ==  2 { event.bind(wall3) }
			if event.x ==  2 && event.y ==  1 { event.bind(wall4) }
			if event.x ==  2 && event.y ==  0 { event.bind(wall5) }
			if event.x ==  2 && event.y == -1 { event.bind(wall6) }
		}
	}
	
	func updateTiles()
	{
		wall3.updateSprite(room.walls[2])
		wall4.updateSprite(room.walls[3])
		wall2.updateSprite(room.walls[1])
		wall5.updateSprite(room.walls[4])
		wall1.updateSprite(room.walls[0])
		wall6.updateSprite(room.walls[5])
		
		floor11.updateSprite(room.floors[2])
		floor01.updateSprite(room.floors[1])
		floor10.updateSprite(room.floors[5])
		floore1.updateSprite(room.floors[0])
		floor00.updateSprite(room.floors[4])
		floor1e.updateSprite(room.floors[7])
		floore0.updateSprite(room.floors[8])
		floor0e.updateSprite(room.floors[3])
		flooree.updateSprite(room.floors[6])
		
		step1.updateSprite(room.steps[0])
		step6.updateSprite(room.steps[5])
		step2.updateSprite(room.steps[1])
		step5.updateSprite(room.steps[4])
		step3.updateSprite(room.steps[2])
		step4.updateSprite(room.steps[3])
	}
	
	func removeEvents()
	{
		for event in events_root.children {
			let event = event as! Event
			event.remove()
		}
	}
	
	func addEvent(event:Event)
	{
		events_root.addChild(event)
	}
	
	func parallaxTo(x:CGFloat, y:CGFloat)
	{
		let pos_x = templates.stage.x + (x * 0.025)
		let pos_y = templates.stage.y + (y * 0.025)
		self.runAction(SKAction.moveTo(CGPoint(x:pos_x,y:pos_y), duration: 0.25), completion: { })
	}
	
	func teleportIn()
	{
		
		self.room = world.all[1]
		updateTiles()
		removeEvents()
		
		for event in room.events {
			addEvent(event)
		}
		
		// Bind sprites to events
		for event in events_root.children {
			let event = event as! Event
			if event.x == -1 && event.y ==  2 { event.bind(wall1) }
			if event.x ==  0 && event.y ==  2 { event.bind(wall2) }
			if event.x ==  1 && event.y ==  2 { event.bind(wall3) }
			if event.x ==  2 && event.y ==  1 { event.bind(wall4) }
			if event.x ==  2 && event.y ==  0 { event.bind(wall5) }
			if event.x ==  2 && event.y == -1 { event.bind(wall6) }
		}
		
		for node in room_root.children {
			node.onRoomTeleportIn()
		}
	}
	
	func teleportOut()
	{
		// Dislocate tiles
		for node in room_root.children {
			node.onRoomTeleportOut()
		}
		
		let action_move = SKAction.moveToY(CGRectGetMidY(gameScene.frame) - gameScene.frame.height, duration: 3)
		action_move.timingMode = .EaseIn
		
		self.runAction(action_move, completion: {
			
			self.testHome()
			
			// DeDislocate tiles
			for node in self.room_root.children {
				node.onRoomTeleportIn()
			}
			self.position = CGPoint(x: templates.stage.x, y: templates.stage.y * 2.5)
			let action_move = SKAction.moveToY(templates.stage.y, duration: 3)
			action_move.timingMode = .EaseOut
			self.runAction(action_move)
			
			player.land()
			
		})
	}
	
	func testHome()
	{
		self.room = world.all[1]
		self.updateTiles()
		self.removeEvents()
		
		for event in self.room.events {
			self.addEvent(event)
		}
		
		// Bind sprites to events
		for event in self.events_root.children {
			let event = event as! Event
			if event.x == -1 && event.y ==  2 { event.bind(wall1) }
			if event.x ==  0 && event.y ==  2 { event.bind(wall2) }
			if event.x ==  1 && event.y ==  2 { event.bind(wall3) }
			if event.x ==  2 && event.y ==  1 { event.bind(wall4) }
			if event.x ==  2 && event.y ==  0 { event.bind(wall5) }
			if event.x ==  2 && event.y == -1 { event.bind(wall6) }
		}
	}
	
	func eventAtLocation(x:Int,y:Int) -> Event!
	{
		for event in events_root.children {
			let event = event as! Event
			if event.x != x || event.y != y { continue }
			return event
		}
		return nil
	}
	
	func tileAtLocation(x:Int,y:Int) -> Tile!
	{
		if x == 1 && y == 1 { return floor11 }
		if x == 0 && y == 1 { return floor01 }
		if x == 1 && y == 0 { return floor10 }
		if x == -1 && y == 1 { return floore1 }
		if x == 0 && y == 0 { return floor00 }
		if x == 1 && y == -1 { return floor1e }
		if x == -1 && y == 0 { return floore1 }
		if x == 0 && y == -1 { return floor0e }
		if x == -1 && y == -1 { return flooree }
		return nil
	}

	func positionAt(x:Int,y:Int) -> CGPoint
	{
		let offset:CGFloat = 0.7
		if x == 1 && y == 1 { return CGPoint(x: 0, y: templates.floor.height * offset) }
		if x == 0 && y == 1 { return CGPoint(x: -templates.floor.width/2, y: templates.floor.height/2 * offset) }
		if x == 1 && y == 0 { return CGPoint(x: templates.floor.width/2, y: templates.floor.height/2 * offset) }
		if x == -1 && y == 1 { return CGPoint(x: -templates.floor.width, y: 0) }
		if x == 0 && y == 0 { return  CGPoint(x: 0, y: 0) }
		if x == 1 && y == -1 { return  CGPoint(x: templates.floor.width, y: 0) }
		if x == -1 && y == 0 { return CGPoint(x: -templates.floor.width/2, y: -templates.floor.height/2 * offset)  }
		if x == 0 && y == -1 { return  CGPoint(x: templates.floor.width/2, y: -templates.floor.height/2 * offset) }
		if x == -1 && y == -1 { return  CGPoint(x: 0, y: -templates.floor.height * offset) }
		return CGPoint(x: 0, y: -300)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}