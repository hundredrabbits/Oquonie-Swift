
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class GameTile : SKSpriteNode
{
	var sprite:Types!
	var id:Int!
	var orientation:Orientation!
	
	init(sprite:Types,id:Int,orientation:Orientation! = nil, position:CGPoint, size: CGSize)
	{
		let imageName = (orientation != nil) ? "\(sprite).\(id).\(orientation).png" : "\(sprite).\(id).png"
		
		print(imageName)
		
		var image:UIImage!
		var texture:SKTexture!

		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		
		super.init(texture: texture, color: UIColor.clearColor(), size: size)
		
//		self.color = UIColor.redColor()
		self.position = position
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}