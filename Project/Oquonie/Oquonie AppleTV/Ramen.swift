
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SceneKit
import Foundation

class Ramen : Wizard
{
	var isKnown:Bool = false
	var isWizard:Bool = false
	
	init(x:Int,y:Int,spell:Personas! = nil, isWizard:Bool = false)
	{
		super.init(x: x, y: y,spell:spell)
		
		self.isWizard = isWizard
		updateSprite("event.ramen.1.png")
	}
	
	override func onRoomEnter()
	{
		updatePresence()
		updateDialog()
	}
	
	func updatePresence()
	{
		if isKnown == true {
			updateSprite("event.ramen.absent")
		}
		else{
			updateSprite("event.ramen.1.png")
		}
	}
	
	override func collide()
	{
		if isKnown == false {
			addToLobby()
		}
	}
	
	func addToLobby()
	{
		isKnown = true
		updatePresence()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}