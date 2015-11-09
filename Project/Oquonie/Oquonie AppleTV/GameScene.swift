
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
    override func didMoveToView(view: SKView)
	{
		start()
    }
	
	func start()
	{
		let world = World()

		let room = GameRoom(room: world.all[2])
		room.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
		addChild(room)
	}

    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
    }
}
