
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
		return ["\(Letter.foe)","\(Letter.unlocked)",spell]
	}
	
	func requiresPillar() -> Array<String>
	{
		return ["\(Letter.foe)","\(Letter.locked)","\(Letter.pillar)"]
	}
	
	func requiresPersona(persona:String) -> Array<String>
	{
		return ["\(Letter.foe)","\(Letter.locked)",persona]
	}
	
	func alreadyIsPersona(spell:String) -> Array<String>
	{
		return ["\(Letter.friend)","\(Letter.correct)",spell]
	}
	
	func transform(persona:String) -> Array<String>
	{
		return ["\(Letter.friend)","\(Letter.outside)",persona]
	}
	
	func confusion() -> Array<String>
	{
		return ["\(Letter.confusion1)","\(Letter.confusion1)","\(Letter.confusion3)"]
	}
	
	func friendFriendFriend() -> Array<String>
	{
		return ["\(Letter.friend)","\(Letter.friend)","\(Letter.friend)"]
	}
	
	func spellbookFull() -> Array<String>
	{
		return ["\(Letter.guide)","\(Letter.locked)","\(Letter.help)"]
	}
	
	func music(toggle:Bool) -> Array<String>
	{
		if toggle == true {
			return ["\(Letter.guide)","\(Letter.unlocked)","\(Letter.sound)"]
		}
		return ["\(Letter.guide)","\(Letter.locked)","\(Letter.sound)"]
	}
	
	func tree(pillarsCount:Int) -> Array<String>
	{
		return ["\(Letter.foe)","\(Letter.locked)","\(Letter.pillar)"]
	}
	
	func shark() -> Array<String>
	{
		if player.hasPillar(pillar_nemedique) == false { return ["\(Letter.foe)","\(Letter.locked)","\(Letter.pillar)"] }
		if player.persona == Personas.necomedre { return ["\(Letter.friend)","\(Letter.unlocked)","\(Letter.necomedre)"] }
		return ["\(Letter.friend)","\(Letter.outside)","\(Letter.necomedre)"]
	}
	
	func pillarSocket(pillar:Pillar) -> Array<String>
	{
		if player.hasPillar(pillar) == true { return ["\(Letter.guide)","\(Letter.unlocked)","\(pillar.persona)"] }
		else { return ["\(Letter.guide)","\(Letter.locked)","\(pillar.persona)"]  }
	}
	
	func owl() -> Array<String>
	{
		// First chapter
		if player.hasPillar(pillar_nemedique) == false {
			if player.persona == Personas.necomedre { return ["\(Letter.guide)","\(Letter.locked)","\(Letter.nephtaline)"] }
			else if player.persona == Personas.nephtaline { return ["\(Letter.guide)","\(Letter.locked)","\(Letter.neomine)"] }
			else if player.persona == Personas.neomine { return ["\(Letter.guide)","\(Letter.locked)","\(Letter.nestorine)"] }
			else if player.persona == Personas.nestorine { return ["\(Letter.guide)","\(Letter.locked)","\(Letter.nemedique)"] }
			else if player.persona == Personas.nemedique { return ["\(Letter.guide)","\(Letter.locked)","\(Letter.pillar)"] }
		}
		return ["\(Letter.guide)","\(Letter.locked)","\(Letter.pillar)"]
	}
	
	func sauveguarde() -> Array<String>
	{
		return ["\(Letter.hiversaires1)","\(Letter.hiversaires2)","\(Letter.hiversaires3)"]
	}
	
	func ramen() -> Array<String>
	{
		return ["\(Letter.outside)","\(Letter.teleport)","\(Letter.guide)"]
	}

	func end1() -> Array<String>
	{
		return ["\(Letter.foe)","\(Letter.inside)","\(Letter.key)"]
	}
	
	func blank() -> Array<String>
	{
		return ["\(Letter.blank)","\(Letter.blank)","\(Letter.blank)"]
	}
	
	func end2() -> Array<String>
	{
		return ["\(Letter.friend)","\(Letter.inside)","\(Letter.key)"]
	}
}
