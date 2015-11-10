
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
		room.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - 150)
		addChild(room)
		
		let player = Player()
		player.position = CGPoint(x: 0, y: 0)
		room.addChild(player)
		player.zPosition = 900
		
		player.runAction(SKAction.moveTo(CGPointMake(110,110), duration:2.0))
	}

    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
    }
}
