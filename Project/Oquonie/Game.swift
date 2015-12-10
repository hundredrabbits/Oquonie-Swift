
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

func debugGame() -> Int
{
	print("! GAME - Starting(debug)..")
	
	pillar_necomedre.isKnown = false
	pillar_nephtaline.isKnown = false
	pillar_neomine.isKnown = false
	pillar_nestorine.isKnown = false
	pillar_nemedique.isKnown = true
	pillar_nastazie.isKnown = false
	
	ramen_necomedre.isKnown = true
	ramen_nephtaline.isKnown = true
	ramen_neomine.isKnown = true
	ramen_nestorine.isKnown = true
	
	player.persona = .neomine
	player.isCompleted = false
	player.isListening = false
	
	print("! GAME - Started(debug).")

	return Waypoints.neomine.rawValue
}

func newGame() -> Int
{
	print("! GAME - Starting..")
	
	pillar_necomedre.isKnown = false
	pillar_nephtaline.isKnown = false
	pillar_neomine.isKnown = false
	pillar_nestorine.isKnown = false
	pillar_nemedique.isKnown = false
	pillar_nastazie.isKnown = false
	
	ramen_necomedre.isKnown = false
	ramen_nephtaline.isKnown = false
	ramen_neomine.isKnown = false
	ramen_nestorine.isKnown = false
	
	player.persona = .necomedre
	player.isCompleted = false
	player.isListening = true
	
	print("! GAME - Started.")
	
	return Waypoints.spawn.rawValue
}

func saveGame()
{
	print("! GAME - Saving..")
	
	let storage = NSUserDefaults.standardUserDefaults()
	
	storage.setObject(pillar_necomedre.isKnown, forKey: "pillar_necomedre")
	storage.setObject(pillar_nephtaline.isKnown, forKey: "pillar_nephtaline")
	storage.setObject(pillar_neomine.isKnown, forKey: "pillar_neomine")
	storage.setObject(pillar_nestorine.isKnown, forKey: "pillar_nestorine")
	storage.setObject(pillar_nemedique.isKnown, forKey: "pillar_nemedique")
	storage.setObject(pillar_nastazie.isKnown, forKey: "pillar_nastazie")
	
	storage.setObject(ramen_necomedre.isKnown, forKey: "ramen_necomedre")
	storage.setObject(ramen_nephtaline.isKnown, forKey: "ramen_nephtaline")
	storage.setObject(ramen_neomine.isKnown, forKey: "ramen_neomine")
	storage.setObject(ramen_nestorine.isKnown, forKey: "ramen_nestorine")
	
	storage.setObject("\(player.persona)", forKey: "persona")
	storage.setObject(player.isCompleted, forKey: "completed")
	storage.setObject(stage.roomId, forKey: "room")
	storage.setObject(player.isListening, forKey: "listening")
	
	print("!!! Save \(player.persona)")
	
	storage.synchronize()
	
	print("! GAME - Saved.")
}

func loadGame() -> Int
{
	print("! GAME - Loading..")
	
	let storage = NSUserDefaults.standardUserDefaults()
	
	if integrity() == false { return newGame() }
	
	pillar_necomedre.isKnown = storage.valueForKey("pillar_necomedre") as! Bool
	pillar_nephtaline.isKnown = storage.valueForKey("pillar_nephtaline") as! Bool
	pillar_neomine.isKnown = storage.valueForKey("pillar_neomine") as! Bool
	pillar_nestorine.isKnown = storage.valueForKey("pillar_nestorine") as! Bool
	pillar_nemedique.isKnown = storage.valueForKey("pillar_nemedique") as! Bool
	pillar_nastazie.isKnown = storage.valueForKey("pillar_nastazie") as! Bool
	
	ramen_necomedre.isKnown = storage.valueForKey("ramen_necomedre") as! Bool
	ramen_nephtaline.isKnown = storage.valueForKey("ramen_nephtaline") as! Bool
	ramen_neomine.isKnown = storage.valueForKey("ramen_neomine") as! Bool
	ramen_nestorine.isKnown = storage.valueForKey("ramen_nestorine") as! Bool
	
	if "\(storage.valueForKey("persona")!)" == "\(Personas.necomedre)" { player.persona = Personas.necomedre }
	else if "\(storage.valueForKey("persona")!)" == "\(Personas.nephtaline)" { player.persona = Personas.nephtaline }
	else if "\(storage.valueForKey("persona")!)" == "\(Personas.neomine)" { player.persona = Personas.neomine }
	else if "\(storage.valueForKey("persona")!)" == "\(Personas.nestorine)" { player.persona = Personas.nestorine }
	else if "\(storage.valueForKey("persona")!)" == "\(Personas.nemedique)" { player.persona = Personas.nemedique }
	else if "\(storage.valueForKey("persona")!)" == "\(Personas.catfishbird)" { player.persona = Personas.catfishbird }
	else if "\(storage.valueForKey("persona")!)" == "\(Personas.nastazie)" { player.persona = Personas.nastazie }
	
	print("!!! Load \(storage.valueForKey("persona")) -> \(player.persona)")
	
	player.isCompleted = storage.valueForKey("completed") as! Bool
	player.isListening = storage.valueForKey("listening") as! Bool
	
	print("! GAME - Loaded.")
	
	return storage.valueForKey("room") as! Int
}

func integrity() -> Bool
{
	print("! GAME - Verfifying Save Integrity..")
	
	let storage = NSUserDefaults.standardUserDefaults()
	
	if storage.valueForKey("pillar_necomedre") == nil { print("X GAME - Missing pillar_necomedre") ; return false }
	if storage.valueForKey("pillar_nephtaline") == nil { print("X GAME - Missing pillar_nephtaline") ; return false }
	if storage.valueForKey("pillar_neomine") == nil { print("X GAME - Missing pillar_neomine") ; return false }
	if storage.valueForKey("pillar_nestorine") == nil { print("X GAME - Missing pillar_nestorine") ; return false }
	if storage.valueForKey("pillar_nemedique") == nil { print("X GAME - Missing pillar_nemedique") ; return false }
	if storage.valueForKey("pillar_nastazie") == nil { print("X GAME - Missing pillar_nastazie") ; return false }
	
	if storage.valueForKey("ramen_necomedre") == nil { print("X GAME - Missing ramen_necomedre") ; return false }
	if storage.valueForKey("ramen_nephtaline") == nil { print("X GAME - Missing ramen_nephtaline") ; return false }
	if storage.valueForKey("ramen_neomine") == nil { print("X GAME - Missing ramen_neomine") ; return false }
	if storage.valueForKey("ramen_nestorine") == nil { print("X GAME - Missing ramen_nestorine") ; return false }
	
	if storage.valueForKey("persona") == nil { print("X GAME - Missing persona") ; return false }
	if storage.valueForKey("completed") == nil { print("X GAME - Missing completed") ; return false }
	if storage.valueForKey("listening") == nil { print("X GAME - Missing listening") ; return false }
	
	print("! GAME - Integrity Passed.")
	
	return true
	
}
