
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

		stage.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - 150)
		addChild(stage)
		
		player.position = CGPoint(x: 0, y: 0)
		player.zPosition = 900
		stage.events_root.addChild(player)
		
		stage.enter(world.all[2])
	}

    override func update(currentTime: CFTimeInterval)
	{
		super.update(currentTime)
    }
}
