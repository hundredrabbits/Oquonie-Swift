
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

let world = World()
let templates = Templates()
let player = Player()
let stage = Stage()

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

enum Orientation
{
	case l
	case r
}

enum Direction
{
	case f
	case b
}

enum States
{
	case stand
	case walk
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
	case photobooth
	case catfishbird
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
	case purgatory
	case play
}

enum Theme
{
	case white
	case black
	case red
	case void
	case pest
}

/*
#define dialogIntroduction			@"KIO"
#define dialogHaveCharacter			@"QIS" // already are the character from that wizard
#define dialogHaveSpell				@"PIR" // already have the spell from that wizard
#define dialogHaveCharacterNot(x)	[NSString stringWithFormat:@"GL%@",x];

#define dialogGainSpell(x)			[NSString stringWithFormat:@"RP%@",x];
#define dialogGainPillar			@"RQY"
#define dialogGainRamen				@"RQO"
#define dialogHaveRamenNot			@"OQT"
#define dialogHavePillars			@"PIY"
#define dialogHavePillarsNot		@"YQT"

#define dialogEnd1					@"HIS"

#define dialogSharkHelp				@"QJT"
#define dialogSharkTransform		@"SID"

#define dialogMapHelp				@"MKQ"

#define dialogWarpLobby				@"MHS"

#define dialogInfoPillar			@"YIS"

#define dialogAudioOn				@"NQI"
#define dialogAudioOff				@"NQJ"

#define dialogTutorialTalk1			@"HIS"
#define dialogTutorialTalk2			@"HIS"
#define dialogTutorialTalk3			@"HIS"
#define dialogNoFace				@"USV"

#define dialogConfusion1			@"UVW"
#define dialogConfusion2			@"WUV"
#define dialogConfusion3			@"VUW"

#define dialogOwlSave				@"PRL"
#define dialogHiversaires			@"789"
*/
