
//  Created by Devine Lu Linvega on 2015-11-30.
//  Copyright © 2015 XXIIVV. All rights reserved

import SpriteKit
import Foundation

class Audio
{
	init()
	{
		
	}
	
	func play(route:soundType,name:String)
	{
		SKAction.playSoundFileNamed("\(route).\(name).wav", waitForCompletion: false)
	}
}