
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
	
	player.persona = .nemedique
	player.isCompleted = true
	player.isListening = false
	
	print("! GAME - Started(debug).")

	return Waypoints.lobby.rawValue
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
	
	let storage = UserDefaults.standard
	
	storage.set(pillar_necomedre.isKnown, forKey: "pillar_necomedre")
	storage.set(pillar_nephtaline.isKnown, forKey: "pillar_nephtaline")
	storage.set(pillar_neomine.isKnown, forKey: "pillar_neomine")
	storage.set(pillar_nestorine.isKnown, forKey: "pillar_nestorine")
	storage.set(pillar_nemedique.isKnown, forKey: "pillar_nemedique")
	storage.set(pillar_nastazie.isKnown, forKey: "pillar_nastazie")
	
	storage.set(ramen_necomedre.isKnown, forKey: "ramen_necomedre")
	storage.set(ramen_nephtaline.isKnown, forKey: "ramen_nephtaline")
	storage.set(ramen_neomine.isKnown, forKey: "ramen_neomine")
	storage.set(ramen_nestorine.isKnown, forKey: "ramen_nestorine")
	
	storage.set("\(player.persona)", forKey: "persona")
	storage.set(player.isCompleted, forKey: "completed")
	storage.set(stage.roomId, forKey: "room")
	storage.set(player.isListening, forKey: "listening")
	
	print("!!! Save \(player.persona)")
	
	storage.synchronize()
	
	print("! GAME - Saved.")
}

func loadGame() -> Int
{
	print("! GAME - Loading..")
	
	let storage = UserDefaults.standard
	
	if integrity() == false { return newGame() }
	
	pillar_necomedre.isKnown = storage.value(forKey: "pillar_necomedre") as! Bool
	pillar_nephtaline.isKnown = storage.value(forKey: "pillar_nephtaline") as! Bool
	pillar_neomine.isKnown = storage.value(forKey: "pillar_neomine") as! Bool
	pillar_nestorine.isKnown = storage.value(forKey: "pillar_nestorine") as! Bool
	pillar_nemedique.isKnown = storage.value(forKey: "pillar_nemedique") as! Bool
	pillar_nastazie.isKnown = storage.value(forKey: "pillar_nastazie") as! Bool
	
	ramen_necomedre.isKnown = storage.value(forKey: "ramen_necomedre") as! Bool
	ramen_nephtaline.isKnown = storage.value(forKey: "ramen_nephtaline") as! Bool
	ramen_neomine.isKnown = storage.value(forKey: "ramen_neomine") as! Bool
	ramen_nestorine.isKnown = storage.value(forKey: "ramen_nestorine") as! Bool
	
	if "\(storage.value(forKey: "persona")!)" == "\(Personas.necomedre)" { player.persona = Personas.necomedre }
	else if "\(storage.value(forKey: "persona")!)" == "\(Personas.nephtaline)" { player.persona = Personas.nephtaline }
	else if "\(storage.value(forKey: "persona")!)" == "\(Personas.neomine)" { player.persona = Personas.neomine }
	else if "\(storage.value(forKey: "persona")!)" == "\(Personas.nestorine)" { player.persona = Personas.nestorine }
	else if "\(storage.value(forKey: "persona")!)" == "\(Personas.nemedique)" { player.persona = Personas.nemedique }
	else if "\(storage.value(forKey: "persona")!)" == "\(Personas.catfishbird)" { player.persona = Personas.catfishbird }
	else if "\(storage.value(forKey: "persona")!)" == "\(Personas.nastazie)" { player.persona = Personas.nastazie }
	
	print("!!! Load \(storage.value(forKey: "persona")) -> \(player.persona)")
	
	player.isCompleted = storage.value(forKey: "completed") as! Bool
	player.isListening = storage.value(forKey: "listening") as! Bool
	
	print("! GAME - Loaded.")
	
	return storage.value(forKey: "room") as! Int
}

func integrity() -> Bool
{
	print("! GAME - Verfifying Save Integrity..")
	
	let storage = UserDefaults.standard
	
	if storage.value(forKey: "pillar_necomedre") == nil { print("X GAME - Missing pillar_necomedre") ; return false }
	if storage.value(forKey: "pillar_nephtaline") == nil { print("X GAME - Missing pillar_nephtaline") ; return false }
	if storage.value(forKey: "pillar_neomine") == nil { print("X GAME - Missing pillar_neomine") ; return false }
	if storage.value(forKey: "pillar_nestorine") == nil { print("X GAME - Missing pillar_nestorine") ; return false }
	if storage.value(forKey: "pillar_nemedique") == nil { print("X GAME - Missing pillar_nemedique") ; return false }
	if storage.value(forKey: "pillar_nastazie") == nil { print("X GAME - Missing pillar_nastazie") ; return false }
	
	if storage.value(forKey: "ramen_necomedre") == nil { print("X GAME - Missing ramen_necomedre") ; return false }
	if storage.value(forKey: "ramen_nephtaline") == nil { print("X GAME - Missing ramen_nephtaline") ; return false }
	if storage.value(forKey: "ramen_neomine") == nil { print("X GAME - Missing ramen_neomine") ; return false }
	if storage.value(forKey: "ramen_nestorine") == nil { print("X GAME - Missing ramen_nestorine") ; return false }
	
	if storage.value(forKey: "persona") == nil { print("X GAME - Missing persona") ; return false }
	if storage.value(forKey: "completed") == nil { print("X GAME - Missing completed") ; return false }
	if storage.value(forKey: "listening") == nil { print("X GAME - Missing listening") ; return false }
	
	print("! GAME - Integrity Passed.")
	
	return true
	
}
