
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

var templates = Templates()
let world = World()
let player = Player()
let stage = Stage()
let spellbook = Spellbook()
let dialog = Dialog()
var parallaxFront:SKSpriteNode!
var parallaxBack:SKSpriteNode!
let dialogs = Dialogs()
var overlay:SKSpriteNode!
var overlay_image:SKSpriteNode!
var fx:SKSpriteNode!
var fx_image:SKSpriteNode!

enum Waypoints : Int
{
	case spawn = 29
	case lobby = 1
	case necomedre = 32
	case nephtaline = 40
	case neomine = 60
	case nastazie = 130
	case nephtaline_pillar = 121
	case neomine_pillar = 71
	case nestorine_pillar = 90
	case nemedique_pillar = 103
	case nastazie_pillar = 147
	
	case cat_wizard1 = 110
}

enum Progress : Int
{
	case tutorial = 1
	case part1 = 2
	case part2 = 3
}

enum Types
{
	case tile
	case step
	case wall
}

struct Templates
{
	var screen:CGRect!
	var stage:CGPoint!
	var floor:CGSize!
	var step:CGSize!
	var wall:CGSize!
	var player:CGSize!
	var spell:CGSize!
	var dialog:CGSize!
	var scale:CGFloat!
}

enum Letter
{
	case nemedique
	case nestorine
	case nephtaline
	case necomedre
	case neomine
	case nastazie
	case door
	case teleport
	case correct
	case incorrect
	case unlocked
	case locked
	case help
	case sound
	case guide
	case inside
	case outside
	case key
	case friend
	case foe
	case confusion1
	case confusion2
	case confusion3
	case document
	case pillar
	case blank
	case hiversaires1
	case hiversaires2
	case hiversaires3
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
	case warp
}

enum Personas
{
	case document
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
	case glitch
}

func distanceBetweenTwoPoints(a:CGPoint,b:CGPoint)->CGFloat
{
	return sqrt(pow(a.x-b.x,2)+pow(a.y-b.y,2));
}

func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat
{
	return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}

func textureWithName(imageName:String) -> SKTexture!
{
	var image:UIImage!
	var texture:SKTexture!
	
	if UIImage(named: imageName) != nil {
		image = UIImage(named: imageName)!
		texture = SKTexture(image: image!)
	}
	else {
		print("! not found \(imageName)")
	}
	return texture
}

var pillar_necomedre = Pillar(x: 0, y: 0, persona: Personas.necomedre)
var pillar_nephtaline = Pillar(x: 0, y: 0, persona: Personas.nephtaline)
var pillar_neomine = Pillar(x: 0, y: 0, persona: Personas.neomine)
var pillar_nestorine = Pillar(x: 0, y: 0, persona: Personas.nestorine)
var pillar_nemedique = Pillar(x: 0, y: 0, persona: Personas.nemedique)
var pillar_nastazie = Pillar(x: 0, y: 0, persona: Personas.nastazie)

var ramen_necomedre = Ramen(x: 1, y: 1)
var ramen_nephtaline = Ramen(x: 1, y: 1)
var ramen_neomine = Ramen(x: -1, y: 1)
var ramen_nestorine = Ramen(x: 1, y: 1)
var ramen_nemedique = Ramen(x: 1, y: 1)