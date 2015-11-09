
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

enum Type
{
	case floor
	case tile
}

enum Orientation
{
	case l
	case r
}

enum Soundtrack
{
	case none
	case lobby
	case nemedique
	case nephtaline
	case neomine
}

enum Theme
{
	case white
}

struct Templates
{
	let floor:CGSize = CGSize(width: 200, height: 141)
	let wall:CGSize = CGSize(width: 200, height: 281)
}

let templates = Templates()

struct Test
{
	let child : (test:String, something:String)
}
