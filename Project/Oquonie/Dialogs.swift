
//  Created by Devine Lu Linvega on 2015-11-17.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class Dialogs
{
	init()
	{
	}
	
	func castSpell(spell:String) -> Array<String>
	{
		return ["\(Letter.friend)","\(Letter.unlocked)",spell]
	}
}
