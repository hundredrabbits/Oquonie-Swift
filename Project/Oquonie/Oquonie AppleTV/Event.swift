
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
	
	var isKnown:Bool = false
	var isVisible:Bool = false
	var activity:Timer!
	var activityFrame:Int = 1
	
	init(x:Int,y:Int)
	{
		super.init()
		
		sprite = SKSpriteNode(texture: nil, color: .clear, size: templates.player)
		addChild(sprite)
		
		self.x = x
		self.y = y
		sprite.position = sprite_position
		
		position = stage.positionAt(self.x, y: self.y)
		
		startActivity()
	}
	
	// MARK: Triggers -
	
	override func onRoomEnter()
	{
		refreshSprite()
	}
	
	// MARK: Animation -
	
	func startActivity()
	{
		if activity != nil { activity.invalidate() }
		activity = Timer.scheduledTimer(timeInterval: 4.5, target: self, selector: #selector(Event.animateIdle), userInfo: nil, repeats: true)
	}
	
	func animateIdle()
	{
		if isVisible == false { return }
		Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(Event.animateFrame1), userInfo: nil, repeats: false)
		Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(Event.animateFrame2), userInfo: nil, repeats: false)
		Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(Event.animateFrame3), userInfo: nil, repeats: false)
		Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(Event.animateFrame2), userInfo: nil, repeats: false)
		Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(Event.animateFrame1), userInfo: nil, repeats: false)
	}
	
	func animateFrame1() { }
	func animateFrame2() { }
	func animateFrame3() { }
	
	func bump()
	{
		sprite.position = CGPoint(x:0,y:sprite_position.y + 5)
		sprite.run( SKAction.moveTo(y: sprite_position.y, duration: 0.1) )
	}
	
	func refreshSprite()
	{
	
	}
	
	func updateSprite(_ imageName:String!)
	{
		if imageName == nil { sprite.texture = nil ; return }
		
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		else{
			print("!ERROR - Event.unknown: \(imageName!)")
		}
		
		sprite.texture = texture
	}
	
	func collide()
	{
		player.isMoving = false
	}
	
	func bind(_ node:Tile)
	{
		
	}
	
	func remove()
	{
		self.isVisible = false
		self.removeFromParent()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}
