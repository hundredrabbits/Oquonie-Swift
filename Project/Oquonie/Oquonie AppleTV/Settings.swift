
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
	let player:CGSize = CGSize(width: 200, height: 281)
}

let world = World()
let templates = Templates()
let player = Player()
let stage = Stage()

enum Orientation
{
	case l
	case r
}

enum Personas
{
	case photocopier
	case necomedre
	case nephtaline
	case neomine
	case nestorine
	case nemedique
	case nastazie
}

enum Soundtrack
{
	case none
	case necomedre
	case lobby
	case nemedique
	case nephtaline
	case neomine
	case quiet
	case nestorine
	case nastazie
	case glitch
	case photobooth
	case endless
	case nepturne
	case pillar
	case warp
}

enum Theme
{
	case white
	case black
	case red
}
