
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class GameRoom : SKNode
{
	let floor11:GameTile!
	
	let floor10:GameTile!
	let floor01:GameTile!
	
	let floor1e:GameTile!
	let floor00:GameTile!
	let floore1:GameTile!
	
	let floor0e:GameTile!
	let floore0:GameTile!
	
	let flooree:GameTile!
	
	init(room:Room)
	{
		floor11 = GameTile(type: Type.tile, id:room.floors[2], position: CGPoint(x: 0, y: templates.floor.height))
		
		floor01 = GameTile(type: Type.tile, id:room.floors[1], position: CGPoint(x: -templates.floor.width/2, y: templates.floor.height/2))
		floor10 = GameTile(type: Type.tile, id:room.floors[5], position: CGPoint(x: templates.floor.width/2, y: templates.floor.height/2))
		
		floore1 = GameTile(type: Type.tile, id:room.floors[0], position: CGPoint(x: -templates.floor.width, y: 0))
		floor00 = GameTile(type: Type.tile, id:room.floors[4], position: CGPoint(x: 0, y: 0))
		floor1e = GameTile(type: Type.tile, id:room.floors[8], position: CGPoint(x: templates.floor.width, y: 0))
		
		floore0 = GameTile(type: Type.tile, id:room.floors[8], position: CGPoint(x: -templates.floor.width/2, y: -templates.floor.height/2))
		floor0e = GameTile(type: Type.tile, id:room.floors[3], position: CGPoint(x: templates.floor.width/2, y: -templates.floor.height/2))
		
		flooree = GameTile(type: Type.tile, id:room.floors[6], position: CGPoint(x: 0, y: -templates.floor.height))
		
		super.init()
		
		start()
	}
	
	func start()
	{
		addChild(floor11)
		
		addChild(floor10)
		addChild(floor01)
		
		addChild(floor1e)
		addChild(floor00)
		addChild(floore1)
		
		addChild(floore0)
		addChild(floor0e)
		
		addChild(flooree)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}