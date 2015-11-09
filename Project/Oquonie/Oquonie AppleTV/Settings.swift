
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

enum Types
{
	case tile
	case step
	case wall
}

struct Templates
{
	let floor:CGSize = CGSize(width: 200, height: 141)
	let step:CGSize = CGSize(width: 200, height: 141)
	let wall:CGSize = CGSize(width: 200, height: 281)
}

let templates = Templates()

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
