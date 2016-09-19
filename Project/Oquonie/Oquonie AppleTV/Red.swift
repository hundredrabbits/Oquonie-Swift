
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Red : Event
{
	var isSeen:Bool = false
	
	init(x:Int,y:Int,orientation:Orientation = .l)
	{
		super.init(x: x, y: y)
		updateSprite("event.redghost.1.png")
		if orientation == Orientation.r { sprite.xScale = -1.0 }
	}
	
	override func onRoomEnter()
	{
		if isSeen == true { return }
		player.lock()
		Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Red.disapear), userInfo: nil, repeats: false)
		
	}
	
	override func collide()
	{
		player.walk(x, destination_y:y)
	}
	
	func disapear()
	{
		let action_move = SKAction.moveTo(y: sprite.position.y + (templates.floor.height * 0.5), duration: 3)
		let action_fade = SKAction.fadeAlpha(to: 0, duration: 3)
		let action_group = SKAction.group([action_move,action_fade])
		
		action_move.timingMode = .easeInEaseOut
		
		sprite.run(action_group, completion:{ self.isSeen = true ; if stage.roomId != 30 { player.unlock() } })
		
		stage.showFx("fx.1.vertical.png",duration:2)
		audio.play(.effect, name: "transform")
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}
