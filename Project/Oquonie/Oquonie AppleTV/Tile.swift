
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Tile : SKSpriteNode
{
	var sprite:Types!
	var id:Int!
	var orientation:Orientation!
	
	init(sprite:Types,id:Int! = nil,orientation:Orientation! = nil, position:CGPoint = CGPoint(x: 0,y: 0), size: CGSize)
	{
		var image:UIImage!
		var texture:SKTexture!
		
		if id != nil {
			let imageName = (orientation != nil) ? "\(sprite).\(id).\(orientation).png" : "\(sprite).\(id).png"
			if UIImage(named: imageName) != nil {
				image = UIImage(named: imageName)!
				texture = SKTexture(image: image!)
			}
		}
		else{
			texture = nil
		}
		
		super.init(texture: texture, color: UIColor.clearColor(), size: size)
		
		self.sprite = sprite
		self.id = id
		self.orientation = orientation
		self.position = position
		self.size = size
	}
	
	func updateSprite(id:Int)
	{
		self.id = id
		
		let imageName = (orientation != nil) ? "\(self.sprite).\(self.id).\(self.orientation).png" : "\(self.sprite).\(self.id).png"
		
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		else if id > 0 {
			print("not found \(imageName)")
		}

		self.texture = texture
	}
	
	override func onRoomEnter()
	{
		let targetPosition = self.position
		
		let offset = randomBetweenNumbers(0, secondNum: 10)
		self.alpha = 0
		self.position = CGPoint(x: position.x, y: position.y - offset)
		
		let action_move = SKAction.moveTo(targetPosition, duration: 0.25)
		let action_fade = SKAction.fadeAlphaTo(1, duration:0.5)
		let action_group = SKAction.group([action_move,action_fade])
		
		action_move.timingMode = .EaseInEaseOut
		
		self.runAction(action_group)
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}