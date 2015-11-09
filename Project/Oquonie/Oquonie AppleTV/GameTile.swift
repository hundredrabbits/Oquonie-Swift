
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class GameTile : SKSpriteNode
{
	var type:Type!
	var id:Int!
	var orientation:Orientation!
	
	init(type:Type,id:Int,orientation:Orientation! = nil, position:CGPoint)
	{
		let texture = (orientation != nil) ? SKTexture(image: UIImage(named: "\(type).\(id).\(orientation).png")!) : SKTexture(image: UIImage(named: "\(type).\(id).png")!)
		let tileSize = (type == Type.floor) ? templates.wall : templates.floor
		
		super.init(texture: texture, color: UIColor.purpleColor(), size: tileSize)
		
		self.color = UIColor.redColor()
		self.position = position
	}
	
	func updateTexture(type:Type,id:Int,orientation:Orientation! = nil)
	{
		self.texture = (orientation != nil) ? SKTexture(image: UIImage(named: "\(type).\(id).\(orientation).png")!) : SKTexture(image: UIImage(named: "\(type).\(id).png")!)
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}