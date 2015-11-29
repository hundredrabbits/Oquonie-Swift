
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright © 2015 Devine Lu Linvega. All rights reserved.

import Foundation
import SpriteKit

let black = SKColor.blackColor()
let white = SKColor.whiteColor()

let rabbitSize:CGFloat = 15

class Rabbit : SKNode
{
	var x:Int!
	var y:Int!
	var sprite:SKShapeNode!
	var moves:Array<CGPoint> = []
	
	init(x:Int,y:Int)
	{
		super.init()
		
		self.x = x
		self.y = y
		
		sprite = SKShapeNode(circleOfRadius: rabbitSize * 0.4)
		sprite.fillColor = white
		sprite.strokeColor = white
		addChild(sprite)
		position = CGPoint(x: Double(x) * Double(rabbitSize) - Double(rabbitSize * 4.5),y: Double(y) * Double(rabbitSize) - Double(rabbitSize * 4.5))
		moves.append(position)
	}
	
	func flee()
	{
		let direction = Direction.random()
		
		var test_x = 0
		var test_y = 0
		
		if direction == Direction.Right { test_x = 1  }
		if direction == Direction.Left  { test_x = -1 }
		if direction == Direction.Up    { test_y = 1  }
		if direction == Direction.Down  { test_y = -1 }
		
		var canMove:Bool = true
		
		for rabbit in rabbits.children {
			let rabbit = rabbit as! Rabbit
			if test_x != 0 && rabbit.x == x + test_x && rabbit.y == y { canMove = false }
			if test_y != 0 && rabbit.x == x && rabbit.y == y + test_y { canMove = false }
		}
		
		if canMove == true {
			x = x + test_x
			y = y + test_y
			position = CGPoint(x: Double(x) * Double(rabbitSize) - Double(rabbitSize * 4.5),y: Double(y) * Double(rabbitSize) - Double(rabbitSize * 4.5))
		}
		moves.append(position)
	}
	
	func sneak()
	{
		if moves.count < 1 { return }
		let action_move = SKAction.moveTo(moves.last!, duration: 0.45)
		action_move.timingMode = .EaseInEaseOut
		runAction(action_move)
		
		moves.removeLast()
	}
	
	func appear(rank:Int)
	{
		let action_scale0 = SKAction.scaleTo(0, duration: 0)
		let action_wait = SKAction.waitForDuration(0.03 * Double(rank))
		let action_scale1 = SKAction.scaleTo(1, duration: 0.5)
		
		let sequence = SKAction.sequence([action_scale0, action_wait, action_scale1])
		self.sprite.runAction(sequence)
	}
	
	// MARK: Tools -

	enum Direction: UInt32
	{
		case Up
		case Down
		case Left
		case Right
		
		static func random() -> Direction
		{
			let rand = arc4random_uniform(Right.rawValue+1)
			return Direction(rawValue: rand)!
		}
	}
	
	// MARK: Default -

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}