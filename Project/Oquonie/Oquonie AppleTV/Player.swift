
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Player : SKSpriteNode
{
	var x:Int = 0
	var y:Int = 0
	
	init()
	{
		let imageName = "char2.stand.l.f.3.png"
		
		var image:UIImage!
		var texture:SKTexture!
		
		if UIImage(named: imageName) != nil {
			image = UIImage(named: imageName)!
			texture = SKTexture(image: image!)
		}
		
		super.init(texture: texture, color: UIColor.redColor(), size: templates.player)
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}