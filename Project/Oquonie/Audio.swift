
//  Created by Devine Lu Linvega on 2015-11-30.
//  Copyright © 2015 XXIIVV. All rights reserved

import SpriteKit
import Foundation

class Audio : SKNode
{
	override init()
	{
		super.init()
	}
	
	func play(route:soundType,name:String)
	{
		print("> PLAY - \(route).\(name)")
		self.runAction(SKAction.playSoundFileNamed("\(route).\(name).wav", waitForCompletion: false))
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}