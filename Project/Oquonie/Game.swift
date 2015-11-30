
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

func debugGame() -> Int
{
	print("! GAME - Starting(debug)..")
	
	pillar_necomedre.isKnown = true
	pillar_nephtaline.isKnown = true
	pillar_neomine.isKnown = true
	pillar_nestorine.isKnown = true
	pillar_nemedique.isKnown = true
	pillar_nastazie.isKnown = true
	
	ramen_necomedre.isKnown = true
	ramen_nephtaline.isKnown = true
	ramen_neomine.isKnown = true
	ramen_nestorine.isKnown = true
	ramen_nemedique.isKnown = true
	
	player.persona = .necomedre
	player.isCompleted = false
	
	print("! GAME - Started(debug).")
	
	return Waypoints.necomedre.rawValue
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
	ramen_nemedique.isKnown = false
	
	player.persona = .necomedre
	player.isCompleted = false
	
	print("! GAME - Started.")
	
	return Waypoints.spawn.rawValue
}

func saveGame()
{
	print("! GAME - Saving..")
	
	let storage = NSUserDefaults.standardUserDefaults()
	
	storage.setObject("\(player.persona)", forKey: "location")
	
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
	storage.setObject(ramen_nemedique.isKnown, forKey: "ramen_nemedique")
	
	storage.setObject("\(player.persona)", forKey: "persona")
	storage.setObject(player.isCompleted, forKey: "completed")
	storage.setObject(stage.roomId, forKey: "room")
	
	storage.synchronize()
	
	print("! GAME - Saved.")
}

func loadGame() -> Int
{
	print("! GAME - Loading..")
	
	let storage = NSUserDefaults.standardUserDefaults()
	
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
	ramen_nemedique.isKnown = storage.valueForKey("ramen_nemedique") as! Bool
	
	if "\(storage.valueForKey("persona"))" == "\(Personas.necomedre)" { player.persona = Personas.necomedre }
	if "\(storage.valueForKey("persona"))" == "\(Personas.nephtaline)" { player.persona = Personas.nephtaline }
	if "\(storage.valueForKey("persona"))" == "\(Personas.neomine)" { player.persona = Personas.neomine }
	if "\(storage.valueForKey("persona"))" == "\(Personas.nestorine)" { player.persona = Personas.nestorine }
	if "\(storage.valueForKey("persona"))" == "\(Personas.nemedique)" { player.persona = Personas.nemedique }
	if "\(storage.valueForKey("persona"))" == "\(Personas.catfishbird)" { player.persona = Personas.catfishbird }
	if "\(storage.valueForKey("persona"))" == "\(Personas.nastazie)" { player.persona = Personas.nastazie }
	
	player.isCompleted = storage.valueForKey("completed") as! Bool
	
	print("! GAME - Loaded.")
	
	return storage.valueForKey("room") as! Int
}
