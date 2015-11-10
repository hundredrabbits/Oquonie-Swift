
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
	
		room.enter(world.all[2])
		
		self.addChild(player)
		
		player.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
		player.zPosition = 900
	}

    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
    }
}
