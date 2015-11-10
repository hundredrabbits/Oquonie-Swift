
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class World
{
	var all:Array<Room!>!
	
	init()
	{
		all = []
		
		var i = 0
		while i < 999 {
			all.append(nil)
			i += 1
		}
		
		createLobby()
	}
	
	func createLobby()
	{
		var room = Room()
		
		room = Room()
		room.floors = [ 0,25,2, 2,8,4, 2,2,2 ]
		room.walls  = [ 0,5,2,2,12,15 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id: 10))
		room.addEvent(Pillar(x: 1, y: -1))
		room.addEvent(Gate(x: 0, y: 2, required:Personas.nephtaline))
		room.addEvent(Warp(x: 2, y: 0, room:2, to_x: -1, to_y:0))
		all[1] = room
		
		room = Room()
		room.floors = [ 1,4,1, 1,5,1, 1,1,5 ]
		room.walls  = [ 16,12,19, 25,25,25 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id: 24))
		room.addEvent(Ramen(x: 1, y: 0))
		room.addEvent(Map(x: -1, y: 2))
		room.addEvent(Warp(x: -2, y: 0, room:1, to_x: 1, to_y:0))
		room.addEvent(Warp(x: 0, y: 2, room:3, to_x: 0, to_y:-1))
		all[2] = room
		
		room = Room()
		room.floors = [ 1,23,1, 6,5,1, 1,1,4 ]
		room.walls  = [ 1,7,1, 1,104,1 ]
		room.steps  = [ 0,7,0, 0,7,0]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: -1, y: 1))
		room.addEvent(Owl(x: 1, y: 1))
		room.addEvent(Blocker(x: -1, y: -1, id:1))
		room.addEvent(Gate(x: 0, y: 2, required:Personas.neomine))
		room.addEvent(Warp(x: -2, y: 0, room:4, to_x: 1, to_y:0))
		room.addEvent(Warp(x: 0, y: -2, room:2, to_x: 0, to_y:1))
		all[3] = room
		
		room = Room()
		room.floors = [ 1,1,1, 6,5,6, 1,1,1 ]
		room.walls  = [ 26,14,26,1,12,1 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id:9))
		room.addEvent(Speaker(x: 1, y: 1))
		room.addEvent(Warp(x: 0, y: 2, room:14, to_x: 0, to_y:-1))
		room.addEvent(Warp(x: 2, y: 0, room:3, to_x: -1, to_y:0))
		room.addEvent(Warp(x: 0, y: -2, room:5, to_x: 0, to_y:1))
		all[4] = room
		
		room = Room()
		room.floors = [ 9,10,9, 4,5,14, 9,9,6 ]
		room.walls  = [ 3,14,3, 3,4,3 ]
		room.steps  = [ 0,7,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: 1, y: 1))
		room.addEvent(Blocker(x: -1, y: 1, id:30))
		room.addEvent(Warp(x: 0, y: 2, room:4, to_x: 0, to_y:-1))
		room.addEvent(Gate(x: 2, y: 0, required:Personas.necomedre))
		room.addEvent(Warp(x: -2, y: 0, room:9, to_x: 1, to_y:0))
		room.addEvent(Warp(x: 0, y: -2, room:6, to_x: 0, to_y:1))
		all[5] = room
		
		room = Room()
		room.floors = [ 9,4,9, 10,5,6, 9,10,9 ]
		room.walls  = [ 3,13,3, 26,13,26 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id:5))
		room.addEvent(Shark(x: 1, y: -1))
		room.addEvent(Warp(x: 0, y: 2, room:5, to_x: 0, to_y:-1))
		room.addEvent(Warp(x: 2, y: 0, room:7, to_x: -1, to_y:0))
		all[6] = room
		
		room = Room()
		room.floors = [ 9,10,0, 0,5,12, 9,0,4 ]
		room.walls  = [ 19,0,0, 0,8,0 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: -1, y: -1))
		room.addEvent(Blocker(x: 0, y: 1, id:11))
		room.addEvent(Gate(x: 2, y: 0, required:Personas.nestorine))
		room.addEvent(Warp(x: -2, y: 0, room:6, to_x: 1, to_y:0))
		all[7] = room
		
		room = Room()
		room.floors = [ 10,27,10, 6,4,5, 0,9,10 ]
		room.walls  = [ 18,9,18, 3,13,3 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: -1, y: 1))
		room.addEvent(Gate(x: 0, y: 2, required:Personas.nemedique))
		room.addEvent(Warp(x: 2, y: 0, room:5, to_x: -1, to_y:0))
		room.addEvent(Warp(x: 0, y: -2, room:11, to_x: 0, to_y:1))
		all[9] = room
	
		room = Room()
		room.floors = [ 4,5,6, 5,33,4, 4,6,5 ]
		room.walls  = [ 36,13,36, 3,37,3 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Warp(x: 0, y: 2, room:9, to_x: 0, to_y:-1))
		room.addEvent(Tree(x: 0, y: 0))
		all[11] = room
		
		room = Room()
		room.floors = [ 0,900,0, 5,5,0, 0,0,0 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(NoFace(x: 0, y: 1))
		room.addEvent(Warp(x: 0, y: -2, room:4, to_x: 0, to_y:1))
		all[14] = room
	}
	
}