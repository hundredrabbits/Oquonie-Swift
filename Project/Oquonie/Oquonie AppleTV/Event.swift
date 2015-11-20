
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Event : SKNode
{
	var sprite:SKSpriteNode!
	var sprite_position:CGPoint = CGPoint(x: 0,y: templates.player.height * 0.335)
	var x:Int!
	var y:Int!
	var target:Tile!
	var orientation:Orientation = .l
	
	var isVisible:Bool = false
	var activity:NSTimer!
	var activityFrame:Int = 1
	
	init(x:Int,y:Int)
	{
		super.init()
		
		sprite = SKSpriteNode(texture: nil, color: .clearColor(), size: templates.player)
		addChild(sprite)
		
		self.x = x
		self.y = y
		sprite.position = sprite_position
		
		position = stage.positionAt(self.x, y: self.y)
		
		startActivity()
	}
	
	// MARK: Animation -
	
	func startActivity()
	{
		if activity != nil { activity.invalidate() }
		activity = NSTimer.scheduledTimerWithTimeInterval(4.5, target: self, selector: "animateIdle", userInfo: nil, repeats: true)
	}
	
	func animateIdle()
	{
		NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "animateFrame1", userInfo: nil, repeats: false)
		NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: "animateFrame2", userInfo: nil, repeats: false)
		NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "animateFrame3", userInfo: nil, repeats: false)
		NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: "animateFrame2", userInfo: nil, repeats: false)
		NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: "animateFrame1", userInfo: nil, repeats: false)
	}
	
	func animateFrame1() { }
	func animateFrame2() { }
	func animateFrame3() { }
	
	func bump()
	{
		sprite.position = CGPoint(x:0,y:sprite_position.y + 5)
		sprite.runAction( SKAction.moveToY(sprite_position.y, duration: 0.1) )
	}
	
	func updateSprite(imageName:String!)
	{
		if imageName == nil { sprite.texture = nil ; return }
		
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		else{
			print("missing: \(imageName)")
		}
		
		sprite.texture = texture
	}
	
	func collide()
	{
		print("hit generic event!")
		player.isMoving = false
	}
	
	func bind(node:Tile)
	{
		print("No bind action")
	}
	
	func remove()
	{
		self.removeFromParent()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}