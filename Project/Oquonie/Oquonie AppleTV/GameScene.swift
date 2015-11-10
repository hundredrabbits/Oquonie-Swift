
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
	var player = Player()
	var room = GameRoom()
	
    override func didMoveToView(view: SKView)
	{
		start()
    }
	
	func start()
	{
		let world = World()

		room.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - 150)
		addChild(room)
		
		player.position = CGPoint(x: 0, y: 0)
		room.addChild(player)
		player.zPosition = 900
		
		room.enter(world.all[2])
	}

    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
    }
}
