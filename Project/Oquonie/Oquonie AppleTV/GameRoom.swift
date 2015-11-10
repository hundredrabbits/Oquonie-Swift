
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class GameRoom : SKNode
{
	let wall1:GameTile!
	let wall2:GameTile!
	let wall3:GameTile!
	let wall4:GameTile!
	let wall5:GameTile!
	let wall6:GameTile!
	
	let floor11:GameTile!
	let floor10:GameTile!
	let floor01:GameTile!
	let floor1e:GameTile!
	let floor00:GameTile!
	let floore1:GameTile!
	let floor0e:GameTile!
	let floore0:GameTile!
	let flooree:GameTile!
	
	let step1:GameTile!
	let step2:GameTile!
	let step3:GameTile!
	let step4:GameTile!
	let step5:GameTile!
	let step6:GameTile!
	
	override init()
	{
		wall3 = GameTile(sprite: Types.wall, orientation:Orientation.r, position: CGPoint(x: -templates.wall.width * 0.5, y: templates.wall.height * 0.77), size: templates.wall)
		wall4 = GameTile(sprite: Types.wall, orientation:Orientation.l, position: CGPoint(x:  templates.wall.width * 0.5, y: templates.wall.height * 0.77), size: templates.wall)
		wall2 = GameTile(sprite: Types.wall, orientation:Orientation.r, position: CGPoint(x: -templates.wall.width, y: templates.wall.height * 0.60), size: templates.wall)
		wall5 = GameTile(sprite: Types.wall, orientation:Orientation.l, position: CGPoint(x:  templates.wall.width, y: templates.wall.height * 0.60), size: templates.wall)
		wall1 = GameTile(sprite: Types.wall, orientation:Orientation.r, position: CGPoint(x: -templates.wall.width * 1.5, y: templates.wall.height * 0.42), size: templates.wall)
		wall6 = GameTile(sprite: Types.wall, orientation:Orientation.l, position: CGPoint(x:  templates.wall.width * 1.5, y: templates.wall.height * 0.42), size: templates.wall)
		
		let offset:CGFloat = 0.7
		
		floor11 = GameTile(sprite: Types.tile, position: CGPoint(x: 0, y: templates.floor.height * offset), size: templates.floor)
		floor01 = GameTile(sprite: Types.tile, position: CGPoint(x: -templates.floor.width/2, y: templates.floor.height/2 * offset), size: templates.floor)
		floor10 = GameTile(sprite: Types.tile, position: CGPoint(x: templates.floor.width/2, y: templates.floor.height/2 * offset), size: templates.floor)
		floore1 = GameTile(sprite: Types.tile, position: CGPoint(x: -templates.floor.width, y: 0), size: templates.floor)
		floor00 = GameTile(sprite: Types.tile, position: CGPoint(x: 0, y: 0), size: templates.floor)
		floor1e = GameTile(sprite: Types.tile, position: CGPoint(x: templates.floor.width, y: 0), size: templates.floor)
		floore0 = GameTile(sprite: Types.tile, position: CGPoint(x: -templates.floor.width/2, y: -templates.floor.height/2 * offset), size: templates.floor)
		floor0e = GameTile(sprite: Types.tile, position: CGPoint(x: templates.floor.width/2, y: -templates.floor.height/2 * offset), size: templates.floor)
		flooree = GameTile(sprite: Types.tile, position: CGPoint(x: 0, y: -templates.floor.height * offset), size: templates.floor)
		
		step1 = GameTile(sprite: Types.step, orientation:Orientation.l, position: CGPoint(x: -templates.step.width * 1.5, y: -templates.step.height), size: templates.step)
		step2 = GameTile(sprite: Types.step, orientation:Orientation.l, position: CGPoint(x: -templates.step.width, y: -templates.step.height * 0.7), size: templates.step)
		step3 = GameTile(sprite: Types.step, orientation:Orientation.l, position: CGPoint(x: -templates.step.width * 0.5, y: -templates.step.height), size: templates.step)
		step4 = GameTile(sprite: Types.step, orientation:Orientation.r, position: CGPoint(x:  templates.step.width * 0.5, y: -templates.step.height), size: templates.step)
		step5 = GameTile(sprite: Types.step, orientation:Orientation.r, position: CGPoint(x:  templates.step.width, y: -templates.step.height * 0.7), size: templates.step)
		step6 = GameTile(sprite: Types.step, orientation:Orientation.r, position: CGPoint(x:  templates.step.width * 1.5, y: -templates.step.height), size: templates.step)
		
		super.init()
		
		start()
	}
	
	func start()
	{
		addChild(wall3)
		addChild(wall4)
		addChild(wall2)
		addChild(wall5)
		addChild(wall1)
		addChild(wall6)
		
		addChild(floor11)
		addChild(floor10)
		addChild(floor01)
		addChild(floor1e)
		addChild(floor00)
		addChild(floore1)
		addChild(floore0)
		addChild(floor0e)
		addChild(flooree)
		
		floor11.zPosition = -5
		floor10.zPosition = -3
		floor01.zPosition = -3
		floor10.zPosition =  0
		floor01.zPosition =  0
		floor01.zPosition =  0
		floore0.zPosition =  3
		floor0e.zPosition =  3
		flooree.zPosition =  5
		
		addChild(step1)
		addChild(step6)
		addChild(step2)
		addChild(step5)
		addChild(step3)
		addChild(step4)
		
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
	}
	
	func enter(room:Room)
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
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}