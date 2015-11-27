
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright © 2015 Devine Lu Linvega. All rights reserved.

import Foundation
import SpriteKit

let black = UIColor.blackColor()
let white = UIColor.whiteColor()

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
		let direction = _Direction.random()
		
		var test_x = 0
		var test_y = 0
		
		if direction == _Direction.Right { test_x = 1  }
		if direction == _Direction.Left  { test_x = -1 }
		if direction == _Direction.Up    { test_y = 1  }
		if direction == _Direction.Down  { test_y = -1 }
		
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

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}

enum _Direction: UInt32
{
	case Up
	case Down
	case Left
	case Right
	
	static func random() -> _Direction
	{
		let rand = arc4random_uniform(Right.rawValue+1)
		return _Direction(rawValue: rand)!
	}
}

