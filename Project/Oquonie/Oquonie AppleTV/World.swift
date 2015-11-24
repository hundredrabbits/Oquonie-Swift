
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
		createNecomedre()
		createNephtaline()
		createNeomine()
		createNestorine()
		createNemedique()
		createNastazie()
		createSecrets()
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
		room.addEvent(Pillar(x: 1, y: -1, display:pillar_nephtaline))
		room.addEvent(Door(x: 0, y: 2, requirement:Personas.nephtaline, room:40, to_x:-1, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:2, to_x: -1, to_y:0))
		all[1] = room
		
		room = Room()
		room.floors = [ 1,4,1, 1,5,1, 1,1,5 ]
		room.walls  = [ 16,12,19, 25,25,25 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id: 24))
		room.addEvent(Ramen(x: 1, y: 0, isWizard:true))
		room.addEvent(Map(x: -1, y: 2, world: "lobby"))
		room.addEvent(Door(x: -2, y: 0, room:1, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: 2, room:3, to_x: 0, to_y:-1))
		all[2] = room
		
		room = Room()
		room.floors = [ 1,23,1, 6,5,1, 1,1,4 ]
		room.walls  = [ 1,7,1, 1,104,1 ]
		room.steps  = [ 0,7,0, 0,7,0]
		room.audio  = .lobby
		room.theme  = .white
		room.addEvent(Pillar(x: -1, y: 1, display:pillar_neomine))
		room.addEvent(Owl(x: 1, y: 1, orientation:.r))
		room.addEvent(Blocker(x: -1, y: -1, id:1))
		room.addEvent(Door(x: 0, y: 2, requirement:.neomine, room:60, to_x:0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:4, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:2, to_x: 0, to_y:1))
		all[3] = room
		
		room = Room()
		room.floors = [ 1,1,1, 6,5,6, 1,1,1 ]
		room.walls  = [ 26,14,26,1,12,1 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = .lobby
		room.theme  = .white
		room.addEvent(Blocker(x: 1, y: 1, id:9))
		room.addEvent(Speaker(x: -1, y: 1, orientation: .r))
		room.addEvent(Door(x: 0, y: 2, room:14, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:3, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:5, to_x: 0, to_y:1))
		all[4] = room
		
		room = Room()
		room.floors = [ 9,10,9, 4,5,14, 9,9,6 ]
		room.walls  = [ 3,14,3, 3,4,3 ]
		room.steps  = [ 0,7,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: 1, y: 1, display:pillar_necomedre))
		room.addEvent(Blocker(x: -1, y: 1, id:30))
		room.addEvent(Door(x: 0, y: 2, room:4, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, requirement:Personas.necomedre, room:32, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:9, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:6, to_x: 0, to_y:1))
		all[5] = room
		
		room = Room()
		room.floors = [ 9,4,9, 10,5,6, 9,10,9 ]
		room.walls  = [ 3,13,3, 26,13,26 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id:5))
		room.addEvent(Shark(x: 1, y: -1))
		room.addEvent(Door(x: 0, y: 2, room:5, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:7, to_x: -1, to_y:0))
		all[6] = room
		
		room = Room()
		room.floors = [ 9,10,0, 0,5,12, 9,0,4 ]
		room.walls  = [ 19,0,0, 0,8,0 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: -1, y: -1, display:pillar_nestorine))
		room.addEvent(Blocker(x: 0, y: 1, id:11))
		room.addEvent(Door(x: 2, y: 0, requirement:Personas.nestorine, room:96, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:6, to_x: 1, to_y:0))
		all[7] = room
		
		room = Room()
		room.floors = [ 10,27,10, 6,4,5, 0,9,10 ]
		room.walls  = [ 18,9,18, 3,13,3 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Pillar(x: -1, y: 1, display:pillar_nemedique))
		room.addEvent(Door(x: 0, y: 2, requirement:Personas.nemedique, room:100, to_x:0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:5, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:11, to_x: 0, to_y:1))
		all[9] = room
	
		room = Room()
		room.floors = [ 4,5,6, 5,33,4, 4,6,5 ]
		room.walls  = [ 36,13,36, 3,37,3 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:9, to_x: 0, to_y:-1))
		room.addEvent(Tree(x: 0, y: 0))
		all[11] = room
		
		room = Room()
		room.floors = [ 0,900,0, 5,5,0, 0,0,0 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(NoFace(x: 0, y: 1, orientation: Orientation.r))
		room.addEvent(Door(x: 0, y: -2, room:4, to_x: 0, to_y:1))
		all[14] = room
	}
	
	func createNecomedre()
	{
		var room = Room()
	
		room = Room()
		room.floors = [ 21,21,21, 21,21,21, 21,21,21 ]
		room.walls  = [ 20,20,20, 24,21,20 ]
		room.steps  = [ 0,0,0, 10,0,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 0, y: 0, id:14))
		room.addEvent(Door(x: 2, y: 1, room:24, to_x: -1, to_y:1))
		room.addEvent(Door(x: -1, y: -2, room:22, to_x: 1, to_y:1))
		all[21] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,21,21, 21,21,21 ]
		room.walls  = [ 24,20,20, 20,21,20 ]
		room.steps  = [ 0,0,0, 0,10,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id:15))
		room.addEvent(Blocker(x: -1, y: 0, id:16))
		room.addEvent(Door(x: -1, y: 2, room:21, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 0, y: -2, room:23, to_x: 0, to_y:1))
		all[22] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,17,21, 21,21,21 ]
		room.walls  = [ 19,1,19, 19,1,19 ]
		room.steps  = [ 0,10,0, 0,0,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Wizard(x: -1, y: 1, spell: Personas.document))
		room.addEvent(Blocker(x: 1, y: 1, id:15))
		room.addEvent(Blocker(x: 1, y: -1, id:15))
		room.addEvent(Door(x: -2, y: 0, room:28, to_x: 1, to_y:0))
		all[23] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,21,21, 21,21,21 ]
		room.walls  = [ 20,24,20, 20,24,21 ]
		room.steps  = [ 10,0,0, 0,10,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id:14))
		room.addEvent(Blocker(x: -1, y: -1, id:16))
		room.addEvent(Door(x: 0, y: 2, room:23, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:27, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 1, room:21, to_x: 1, to_y:1))
		room.addEvent(Door(x: 0, y: -2, room:25, to_x: 0, to_y:1))
		all[24] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,18,21, 21,21,21 ]
		room.walls  = [ 21,20,20, 20,24,20 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:15))
		room.addEvent(Blocker(x: 1, y: 1, id:16, orientation: .r))
		room.addEvent(Wizard(x: 1, y: -1, spell: Personas.document))
		room.addEvent(Door(x: 2, y: 0, room:28, to_x: -1, to_y:0))
		all[25] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,21,21, 21,21,21 ]
		room.walls  = [ 20,24,20, 20,20,21 ]
		room.steps  = [ 0,10,0, 0,0,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:14))
		room.addEvent(Blocker(x: -1, y: 0, id:16))
		room.addEvent(Door(x: 0, y: 2, room:25, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:23, to_x: 1, to_y:0))
		all[26] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,19,21, 21,21,21 ]
		room.walls  = [ 19,19,19, 19,21,20 ]
		room.steps  = [ 0,0,0, 0,10,0 ]
		room.audio  = .quiet
		room.theme  = .black
		room.addEvent(Blocker(x: -1, y: 1, id:15))
		room.addEvent(Speaker(x: 0, y: 1, orientation: .r, special: true))
		room.addEvent(Blocker(x: 1, y: 1, id:15))
		room.addEvent(Blocker(x: 1, y: -1, id:16, orientation: .r))
		room.addEvent(Door(x: 0, y: -2, room:28, to_x: 0, to_y:1))
		all[27] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,21,21, 21,21,21 ]
		room.walls  = [ 20,24,20, 20,24,21 ]
		room.steps  = [ 0,10,0, 0,10,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:14))
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.document))
		room.addEvent(Blocker(x: -1, y: -1, id:16))
		room.addEvent(Door(x: 0, y: 2, room:27, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:23, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:25, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:29, to_x: 0, to_y:1))
		all[28] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,8,21, 21,21,21 ]
		room.walls  = [ 20,24,20, 20,28,21 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = .quiet
		room.theme  = .white
		room.addEvent(Blocker(x: -1, y: 1, id:15))
		room.addEvent(Blocker(x: 1, y: -1, id:16))
		room.addEvent(Door(x: 0, y: 2, room:28, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, requirement: Personas.document, room:30, to_x:-1, to_y:0))
		all[29] = room
		
		room = Room()
		room.floors = [ 21,21,21, 21,1,1, 21,21,1 ]
		room.walls  = [ 20,20,20, 20,21,20 ]
		room.steps  = [ 0,3,0, 0,0,0 ]
		room.audio  = Soundtrack.quiet
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:16))
		room.addEvent(Blocker(x: 1, y: -1, id:1))
		room.addEvent(Boss(x: 1, y: 0, orientation: .r))
		room.addEvent(Door(x: 0, y: 2, room:31, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:29, to_x:1, to_y:0))
		all[30] = room
		
		room = Room()
		room.floors = [ 4,5,6, 4,5,4, 5,5,6 ]
		room.walls  = [ 26,26,26, 26,40,15 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.black
		room.addEvent(Red(x: 0, y: 1))
//		room.addEvent(Door(x: 2, y: 0, requirement: Personas.necomedre))
		all[31] = room
		
		room = Room()
		room.floors = [ 33,33,33, 6,4,5, 33,33,14 ]
		room.walls  = [ 36,16,36, 19,12,19 ]
		room.steps  = [ 0,5,0, 0,6,0 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:23))
		room.addEvent(Owl(x: 1, y: 1))
		room.addEvent(Map(x: 0, y: 2, world: "necomedre"))
		room.addEvent(Door(x: 2, y: 0, room:33, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, requirement: Personas.necomedre, room:5, to_x:1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:35, to_x: 0, to_y:1))
		all[32] = room
		
		room = Room()
		room.floors = [ 33,33,33, 33,4,6, 33,4,5 ]
		room.walls  = [ 36,36,26, 19,12,15 ]
		room.steps  = [ 0,7,0, 0,0,6 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nephtaline, orientation:Orientation.r))
		room.addEvent(Door(x: 2, y: 0, room:34, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:32, to_x: 1, to_y:0))
		room.addEvent(Door(x: 1, y: -2, room:36, to_x: 1, to_y:1))
		all[33] = room
		
		room = Room()
		room.floors = [ 33,35,35, 35,6,5, 33,35,4 ]
		room.walls  = [ 36,25,8, 36,12,26 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nestorine, requiresPillar: true, orientation:Orientation.r))
		room.addEvent(Blocker(x: -1, y: 1, id:11))
		room.addEvent(Door(x: 1, y: 2, requirement: Personas.nestorine, room:120, to_x:1, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:35, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:33, to_x: 1, to_y:0))
		all[34] = room
		
		room = Room()
		room.floors = [ 33,33,33, 33,33,33, 33,33,33 ]
		room.walls  = [ 26,12,26, 19,12,19 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Ramen(x: 1, y: 1))
		room.addEvent(Speaker(x: -1, y: 1, orientation: Orientation.r))
		room.addEvent(Door(x: 0, y: 2, room:32, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:36, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:34, to_x: 1, to_y:0))
		all[35] = room
		
		room = Room()
		room.floors = [ 33,0,4, 0,0,4, 33,4,33 ]
		room.walls  = [ 26,0,12, 19,12,19 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Wizard(x: -1, y: 1, spell: Personas.nephtaline, orientation:Orientation.r))
		room.addEvent(Red(x: 1, y: -1))
		room.addEvent(Door(x: 1, y: 2, room:33, to_x: 1, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:37, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:35, to_x: 1, to_y:0))
		all[36] = room
		
		room = Room()
		room.floors = [ 33,4,4, 4,33,4, 33,4,33 ]
		room.walls  = [ 105,26,26, 26,12,26 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nemedique, requiresPillar: true, orientation:Orientation.r))
		room.addEvent(Blocker(x: 0, y: -1, id:23))
//		room.addEvent(Door(x: -1, y: 2, requirement: Personas.photobooth))
		room.addEvent(Door(x: 2, y: 0, room:38, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:36, to_x: 1, to_y:0))
		all[37] = room
		
		room = Room()
		room.floors = [ 9,33,33, 33,33,13, 9,33,4 ]
		room.walls  = [ 26,26,26, 18,5,18 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.necomedre
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nephtaline, orientation:Orientation.r))
		room.addEvent(Blocker(x: -1, y: -1, id:5))
		room.addEvent(Door(x: 2, y: 0, requirement: Personas.nephtaline, room:39, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:37, to_x: 1, to_y:0))
		all[38] = room
		
		room = Room()
		room.floors = [ 33,33,4, 33,7,33, 5,33,18 ]
		room.walls  = [ 26,19,36, 36,19,19 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.warp
		room.theme  = Theme.white
		room.addEvent(Teleport(x: 0, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:38, to_x: 1, to_y:0))
		all[39] = room
		
		room = Room()
		room.floors = [ 4,9,5, 9,32,9, 5,6,9 ]
		room.walls  = [ 36,37,36, 36,37,36 ]
		room.steps  = [ 0,0,0, 0,6,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.red
		room.addEvent(pillar_necomedre)
		room.addEvent(Door(x: 0, y: -2, room:34, to_x: 0, to_y:1))
		all[120] = room
	
	}
	
	func createNephtaline()
	{
		var room = Room()
	
		room = Room()
		room.floors = [ 18,6,4, 0,0,30, 25,32,5 ]
		room.walls  = [ 0,0,0, 12,0,3 ]
		room.steps  = [ 0,0,0, 6,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Red(x: 1, y: -1))
		room.addEvent(Door(x: 2, y: 1, room:41, to_x: -1, to_y:1))
		room.addEvent(Door(x: -1, y: -2, requirement: .nephtaline, room:1, to_x:0, to_y:1))
		all[40] = room
		
		room = Room()
		room.floors = [ 4,5,19, 30,0,6, 32,5,0 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 7,0,0, 0,0,7 ]
		room.audio  = .nephtaline
		room.theme  = .white
		room.addEvent(Door(x: -2, y: 1, room:40, to_x: 1, to_y:1))
		room.addEvent(Door(x: 1, y: -2, room:42, to_x: 1, to_y:1))
		all[41] = room
		
		room = Room()
		room.floors = [ 32,0,5, 6,0,4, 4,17,30 ]
		room.walls  = [ 3,0,13, 0,0,0 ]
		room.steps  = [ 0,0,7, 0,0,0 ]
		room.audio  = .nephtaline
		room.theme  = .white
		room.addEvent(Wizard(x: -1, y: 1, spell: .nemedique, requiresPillar: true, orientation: .r))
		room.addEvent(Door(x: 1, y: 2, room:41, to_x: 1, to_y:-1))
		room.addEvent(Door(x: -2, y: -1, room:43, to_x: 1, to_y:-1))
		all[42] = room
		
		room = Room()
		room.floors = [ 4,30,32, 4,0,0, 16,4,4 ]
		room.walls  = [ 13,0,3, 3,0,13 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Blocker(x: 1, y: 1, id:10))
		room.addEvent(Door(x: -1, y: 2, room:44, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 2, y: -1, room:42, to_x: -1, to_y:-1))
		all[43] = room
		
		room = Room()
		room.floors = [ 18,4,4, 0,0,30, 4,32,4 ]
		room.walls  = [ 0,0,0, 12,0,0 ]
		room.steps  = [ 0,0,0, 7,0,0 ]
		room.audio  = .nephtaline
		room.theme  = .white
		room.addEvent(Wizard(x: 1, y: -1, spell: .neomine))
		room.addEvent(Door(x: 2, y: 1, room:45, to_x: -1, to_y:1))
		room.addEvent(Door(x: -1, y: -2, room:43, to_x: -1, to_y:1))
		all[44] = room
		
		room = Room()
		room.floors = [ 4,4,17, 0,0,4, 32,4,30 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 7,0,0, 0,0,7 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: -1, id:7))
		room.addEvent(Door(x: -2, y: 1, room:46, to_x: 1, to_y:1))
//		room.addEvent(Wizard(x: 1, y: -2, spell: catDoorFork))
		all[45] = room
		
		room = Room()
		room.floors = [ 3,5,6, 3,4,3, 3,3,17 ]
		room.walls  = [ 18,18,18, 13,18,18 ]
		room.steps  = [ 0,7,0, 0,7,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:13))
		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.neomine))
//		room.addEvent(Door(x: 0, y: 2, requirement: Personas.photobooth))
		room.addEvent(Door(x: 2, y: 1, room:41, to_x: -1, to_y:1))
		room.addEvent(Door(x: -2, y: 0, room:47, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:51, to_x: 0, to_y:1))
		all[46] = room
		
		room = Room()
		room.floors = [ 0,0,4, 5,10,5, 0,0,0 ]
		room.walls  = [ 0,0,0, 3,13,3 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.necomedre, requiresPillar: true, orientation: .r))
		room.addEvent(Door(x: 2, y: 0, room:46, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:48, to_x: 0, to_y:1))
		all[47] = room
		
		room = Room()
		room.floors = [ 0,5,0, 0,10,5, 0,0,0 ]
		room.walls  = [ 0,13,0, 0,13,0 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:47, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:49, to_x: -1, to_y:0))
		all[48] = room
		
		room = Room()
		room.floors = [ 0,5,0, 0,10,0, 0,0,5 ]
		room.walls  = [ 0,13,0, 0,0,0 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:50, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:48, to_x: 1, to_y:0))
		all[49] = room
		
		room = Room()
		room.floors = [ 3,32,3, 32,31,32, 3,3,32 ]
		room.walls  = [ 3,9,3, 2,16,2 ]
		room.steps  = [ 0,7,0, 0,7,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Owl(x: 1, y: 1))
		room.addEvent(Blocker(x: 1, y: 0, id:21))
		room.addEvent(Door(x: 0, y: 2, requirement: Personas.nemedique, room:121, to_x:0, to_y:-1))
		room.addEvent(Map(x: 2, y: 0, world: "nephtaline"))
		room.addEvent(Door(x: -2, y: 0, room:47, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:55, to_x: 0, to_y:1))
		all[50] = room
		
		room = Room()
		room.floors = [ 0,5,5, 0,10,5, 0,0,5 ]
		room.walls  = [ 3,13,3, 0,0,0 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Speaker(x: 1, y: 1))
		room.addEvent(Door(x: 0, y: 2, room:50, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:48, to_x: 1, to_y:0))
		all[51] = room
		
		room = Room()
		room.floors = [ 0,5,0, 0,10,5, 0,0,0 ]
		room.walls  = [ 0,13,0, 0,13,0 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:47, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:49, to_x: -1, to_y:0))
		all[52] = room
		
		room = Room()
		room.floors = [ 0,0,0, 5,10,5, 0,0,0 ]
		room.walls  = [ 0,0,0, 3,13,3 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Door(x: 2, y: 0, room:41, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:48, to_x: 0, to_y:1))
		all[53] = room
		
		room = Room()
		room.floors = [ 3,4,3, 5,10,3, 3,3,4 ]
		room.walls  = [ 3,8,3, 3,3,3 ]
		room.steps  = [ 0,7,0, 0,7,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
//		room.addEvent(Wizard(x: 1, y: 1, spell: null))
//		> gateNestorine
//		10 > 8|gateNestorine
		room.addEvent(Door(x: -2, y: 0, room:47, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:51, to_x: 0, to_y:1))
		all[54] = room
		
		room = Room()
		room.floors = [ 0,5,0, 0,10,0, 0,0,5 ]
		room.walls  = [ 0,13,0, 0,0,0 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = .nephtaline
		room.theme  = .white
		room.addEvent(Door(x: 0, y: 2, room:50, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:56, to_x: 1, to_y:0))
		all[55] = room
		
		room = Room()
		room.floors = [ 0,5,0, 0,10,5, 0,0,0 ]
		room.walls  = [ 0,13,0, 0,13,0 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:57, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:55, to_x: -1, to_y:0))
		all[56] = room
		
		room = Room()
		room.floors = [ 0,5,5, 5,10,5, 0,0,0 ]
		room.walls  = [ 0,0,0, 3,13,3 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(ramen_nephtaline)
		room.addEvent(Door(x: 2, y: 0, room:58, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:56, to_x: 0, to_y:1))
		all[57] = room
		
		room = Room()
		room.floors = [ 31,4,31, 31,5,31, 31,31,4 ]
		room.walls  = [ 18,7,18, 18,18,18 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.neomine))
		room.addEvent(Door(x: 0, y: 2, requirement: Personas.neomine, room:59, to_x:0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:47, to_x: 1, to_y:0))
		all[58] = room
		
		room = Room()
		room.floors = [ 32,29,32, 5,7,29, 32,32,29 ]
		room.walls  = [ 3,2,3, 3,2,3 ]
		room.steps  = [ 0,0,0, 0,4,0 ]
		room.audio  = Soundtrack.warp
		room.theme  = Theme.white
		room.addEvent(Teleport(x: 0, y: 0))
		room.addEvent(Door(x: 0, y: -2, requirement: Personas.neomine, room:58, to_x:0, to_y:1))
		all[59] = room
		
		room = Room()
		room.floors = [ 97,31,97, 31,4,31, 98,98,31 ]
		room.walls  = [ 25,18,25, 25,18,25 ]
		room.steps  = [ 0,0,0, 0,3,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.red
		room.addEvent(pillar_nephtaline)
		room.addEvent(Door(x: 0, y: -2, requirement: Personas.nemedique, room:50, to_x:0, to_y:1))
		all[121] = room
	}
	
	func createNeomine()
	{
		var room = Room()
	
		room = Room()
		room.floors = [ 1,4,18, 23,4,1, 1,1,1 ]
		room.walls  = [ 33,31,33, 30,16,14 ]
		room.steps  = [ 0,0,0, 0,4,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Blocker(x: 0, y: 1, id:13))
		room.addEvent(Door(x: 2, y: 1, room:62, to_x: -1, to_y:1))
		room.addEvent(Map(x: 2, y: 0, world: "neomine"))
		//		room.addEvent(Wizard(x: 2, y: -1, spell: petuniaFork))
		room.addEvent(Door(x: 0, y: -2, requirement: Personas.neomine, room:3, to_x:0, to_y:1))
		room.addEvent(Door(x: 2, y: -1, room:61, to_x:-1, to_y:-1))
		all[60] = room
		
		room = Room()
		room.floors = [ 1,1,1, 1,1,38, 1,1,38 ]
		room.walls  = [ 31,30,31, 33,31,33 ]
		room.steps  = [ 0,0,3, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Blocker(x: -1, y: 1, id:19))
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nestorine, orientation:.r))
		room.addEvent(Blocker(x: 1, y: 1, id:19))
		room.addEvent(Door(x: -2, y: -1, room:60, to_x: 1, to_y:-1))
		all[61] = room
		
		room = Room()
		room.floors = [ 4,5,6, 4,6,33, 6,5,5 ]
		room.walls  = [ 32,31,32, 36,4,36 ]
		room.steps  = [ 3,0,3, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: .necomedre, requiresPillar:true))
		room.addEvent(Blocker(x: 1, y: -1, id:23))
		room.addEvent(Door(x: 2, y: 0, requirement: .necomedre, room:71, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 1, room:60, to_x: 1, to_y:1))
		room.addEvent(Door(x: -2, y: -1, room:63, to_x: 1, to_y:-1))
		all[62] = room
		
		room = Room()
		room.floors = [ 10,10,10, 10,0,10, 10,9,10 ]
		room.walls  = [ 32,33,32, 14,30,14 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(ramen_neomine)
		room.addEvent(Blocker(x: 0, y: 0, id:9))
		room.addEvent(Door(x: 2, y: 1, room:66, to_x: -1, to_y:1))
		room.addEvent(Door(x: 2, y: 0, room:64, to_x: -1, to_y:0))
		room.addEvent(Door(x: 2, y: -1, room:62, to_x: -1, to_y:-1))
		all[63] = room
		
		room = Room()
		room.floors = [ 39,1,39, 36,32,36, 39,1,36 ]
		room.walls  = [ 33,33,33, 31,31,15 ]
		room.steps  = [ 3,3,3, 0,0,0 ]
		room.audio  = .neomine
		room.theme  = .black
		room.addEvent(Blocker(x: 1, y: 1, id:21))
		room.addEvent(Wizard(x: 1, y: 0, spell: .nephtaline, requiresPillar:true))
		room.addEvent(Door(x: -2, y: 1, room:68, to_x: 1, to_y:1))
		room.addEvent(Door(x: -2, y: 0, room:63, to_x: 1, to_y:0))
		room.addEvent(Door(x: -2, y: -1, room:65, to_x: 1, to_y:-1))
		all[64] = room
		
		room = Room()
		room.floors = [ 0,33,1, 33,33,1, 1,33,1 ]
		room.walls  = [ 0,3,3, 3,15,14 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nestorine))
		room.addEvent(Blocker(x: 1, y: 0, id:1))
		room.addEvent(Door(x: 2, y: -1, room:64, to_x: -1, to_y:-1))
		all[65] = room
		
		room = Room()
		room.floors = [ 39,36,39, 36,28,29, 39,39,36 ]
		room.walls  = [ 31,31,31, 33,32,33 ]
		room.steps  = [ 3,3,3, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Blocker(x: 1, y: 1, id:13))
		room.addEvent(Owl(x: 1, y: 0))
//		room.addEvent(Door(x: 0, y: 2, requirement: Personas.photoBooth))
		room.addEvent(Door(x: -2, y: 1, room:63, to_x: 1, to_y:1))
		room.addEvent(Door(x: -2, y: 0, room:67, to_x: 1, to_y:0))
		room.addEvent(Door(x: -2, y: -1, room:68, to_x: 1, to_y:-1))
		all[66] = room
		
		room = Room()
		room.floors = [ 1,36,1, 1,39,36, 1,1,1 ]
		room.walls  = [ 25,25,25, 31,30,31 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nestorine, orientation: .r))
		room.addEvent(Door(x: 2, y: 0, room:66, to_x: -1, to_y:0))
		all[67] = room
		
		room = Room()
		room.floors = [ 38,10,38, 6,9,10, 5,10,4 ]
		room.walls  = [ 35,38,20, 30,30,30 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = .neomine
		room.theme  = .black
		room.addEvent(Red(x: -1, y: 1, orientation: .r))
//		room.addEvent(Door(x: 0, y: 2, requirement: Personas.Hiversaires))
		room.addEvent(Door(x: 2, y: 1, room:64, to_x: -1, to_y:1))
		room.addEvent(Door(x: 2, y: 0, room:69, to_x: -1, to_y:0))
		room.addEvent(Door(x: 2, y: -1, room:66, to_x: -1, to_y:-1))
		all[68] = room
		
		room = Room()
		room.floors = [ 35,35,34, 35,35,12, 35,34,35 ]
		room.walls  = [ 35,34,35, 34,8,34 ]
		room.steps  = [ 0,3,0, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Speaker(x: 1, y: 1))
		room.addEvent(Door(x: 2, y: 0, requirement: Personas.nestorine, room:70, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:68, to_x: 1, to_y:0))
		all[69] = room
		
		room = Room()
		room.floors = [ 39,40,39, 40,7,40, 39,39,40 ]
		room.walls  = [ 29,29,29, 29,29,29 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.warp
		room.theme  = Theme.black
		room.addEvent(Teleport(x: 0, y: 0))
		room.addEvent(Door(x: -1, y: 2, room:70, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 0, y: 2, room:70, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 1, y: 2, room:70, to_x: 1, to_y:-1))
		room.addEvent(Door(x: 2, y: 1, room:70, to_x: -1, to_y:1))
		room.addEvent(Door(x: 2, y: 0, room:70, to_x: -1, to_y:0))
		room.addEvent(Door(x: 2, y: -1, room:70, to_x: -1, to_y:1))
		room.addEvent(Door(x: -2, y: 0, requirement: Personas.nestorine, room:69, to_x:1, to_y:0))
		all[70] = room
		
		room = Room()
		room.floors = [ 1,29,1, 29,37,29, 1,1,29 ]
		room.walls  = [ 18,17,18, 18,17,18 ]
		room.steps  = [ 0,3,0, 0,0,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.red
		room.addEvent(pillar_neomine)
		room.addEvent(Door(x: -2, y: 0, requirement: Personas.necomedre, room:62, to_x:1, to_y:0))
		all[71] = room
	}
	
	func createNestorine()
	{
		var room = Room()
	
		room = Room()
		room.floors = [ 35,35,7, 34,8,35, 35,35,34 ]
		room.walls  = [ 35,15,35, 34,15,34 ]
		room.steps  = [ 0,7,0, 0,7,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:23))
		room.addEvent(Teleport(x: 1, y: 1,destination:7))
		room.addEvent(Door(x: -2, y: 0, room:81, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:82, to_x: 0, to_y:1))
		all[80] = room
		
		room = Room()
		room.floors = [ 34,35,35, 35,35,35, 34,34,35 ]
		room.walls  = [ 34,35,34, 25,15,25 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Door(x: -2, y: 0, room:83, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:84, to_x: 0, to_y:1))
		all[81] = room
		
		room = Room()
		room.floors = [ 34,35,34, 35,35,34, 34,34,35 ]
		room.walls  = [ 25,15,25, 35,34,35 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: -1, id:11))
		room.addEvent(Door(x: -2, y: 0, room:84, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:85, to_x: 0, to_y:1))
		all[82] = room
		
		room = Room()
		room.floors = [ 34,34,34, 35,35,35, 35,0,35 ]
		room.walls  = [ 35,34,35, 26,15,26 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: -1, id:23))
		room.addEvent(Door(x: -2, y: 0, room:86, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:87, to_x: 0, to_y:1))
		all[83] = room
		
		room = Room()
		room.floors = [ 34,35,35, 35,35,35, 35,34,35 ]
		room.walls  = [ 35,15,34, 34,15,35 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Owl(x: 1, y: 1))
		room.addEvent(Blocker(x: -1, y: -1, id:11))
		room.addEvent(Door(x: -2, y: 0, room:87, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:88, to_x: 0, to_y:1))
		all[84] = room
		
		room = Room()
		room.floors = [ 34,35,35, 35,35,35, 0,34,35 ]
		room.walls  = [ 26,15,26, 34,16,34 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Red(x: 1, y: 0))
		room.addEvent(Map(x: 2, y: 0, world: "nestorine"))
		room.addEvent(Door(x: -2, y: 0, room:88, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:89, to_x: 0, to_y:1))
		all[85] = room
		
		room = Room()
		room.floors = [ 34,10,34, 0,35,35, 34,34,35 ]
		room.walls  = [ 34,34,34, 25,15,25 ]
		room.steps  = [ 0,1,0, 0,0,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Door(x: -2, y: 0, room:80, to_x: 1, to_y:0))
		all[86] = room
		
		room = Room()
		room.floors = [ 35,35,35, 35,35,35, 35,0,35 ]
		room.walls  = [ 25,15,25, 26,15,26 ]
		room.steps  = [ 0,0,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Speaker(x: 1, y: 1))
		room.addEvent(Door(x: 0, y: -2, room:91, to_x: 0, to_y:1))
		all[87] = room
		
		room = Room()
		room.floors = [ 34,35,35, 34,35,35, 34,0,35 ]
		room.walls  = [ 36,15,36, 36,15,0 ]
		room.steps  = [ 0,1,0, 0,0,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(ramen_nestorine)
		room.addEvent(Door(x: -2, y: 0, room:91, to_x: 1, to_y:0))
		all[88] = room
		
		room = Room()
		room.floors = [ 34,35,0, 35,35,34, 34,34,34 ]
		room.walls  = [ 26,15,0, 0,34,34 ]
		room.steps  = [ 0,0,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
//		room.addEvent(Door(x: 2, y: 0, requirement: Personas.photobooth))
		room.addEvent(Door(x: 0, y: -2, room:80, to_x: 0, to_y:1))
		all[89] = room
		
		room = Room()
		room.floors = [ 35,34,35, 34,38,34, 35,35,34 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 0,0,0, 0,6,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.red
		room.addEvent(pillar_nestorine)
		room.addEvent(Door(x: 0, y: -2, requirement: Personas.nephtaline, room:93, to_x:0, to_y:1))
		all[90] = room
		
		room = Room()
		room.floors = [ 34,35,35, 35,35,35, 34,35,35 ]
		room.walls  = [ 25,15,25, 25,15,25 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nephtaline, requiresPillar:true))
		room.addEvent(Blocker(x: -1, y: -1, id:23))
		room.addEvent(Door(x: -2, y: 0, room:93, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:94, to_x: 0, to_y:1))
		all[91] = room
		
		room = Room()
		room.floors = [ 28,38,28, 38,7,36, 28,28,36 ]
		room.walls  = [ 31,37,31, 31,37,31 ]
		room.steps  = [ 0,1,0, 0,0,0 ]
		room.audio  = Soundtrack.warp
		room.theme  = Theme.white
		room.addEvent(Teleport(x: 0, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:94, to_x: 1, to_y:0))
		all[92] = room
		
		room = Room()
		room.floors = [ 35,34,35, 35,32,35, 35,35,35 ]
		room.walls  = [ 1,5,1, 25,15,25 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nemedique))
		room.addEvent(Blocker(x: -1, y: 1, id:11))
		room.addEvent(Door(x: 0, y: 2, requirement: Personas.nephtaline, room:90, to_x:0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:80, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:95, to_x: 0, to_y:1))
		all[93] = room
		
		room = Room()
		room.floors = [ 5,4,3, 10,9,11, 4,3,10 ]
		room.walls  = [ 25,15,25, 3,9,3 ]
		room.steps  = [ 0,3,0, 0,0,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nemedique))
		room.addEvent(Door(x: 2, y: 0, requirement: Personas.nemedique, room:92, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:95, to_x: 1, to_y:0))
		all[94] = room
		
		room = Room()
		room.floors = [ 34,35,35, 35,35,35, 35,0,35 ]
		room.walls  = [ 25,15,25, 26,15,0 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nemedique))
		room.addEvent(Blocker(x: -1, y: -1, id:23))
		room.addEvent(Door(x: -2, y: 0, room:80, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:80, to_x: 0, to_y:1))
		all[95] = room
		
		room = Room()
		room.floors = [ 35,35,35, 35,7,35, 35,35,34 ]
		room.walls  = [ 34,35,34, 19,19,19 ]
		room.steps  = [ 0,1,0, 0,0,0 ]
		room.audio  = Soundtrack.warp
		room.theme  = Theme.white
		room.addEvent(Teleport(x: 0, y: 0, destination: 80))
		room.addEvent(Door(x: -2, y: 0, requirement: .nestorine, room:7, to_x:1, to_y:0))
		all[96] = room
		
		room = Room()
		room.floors = [ 35,35,35, 35,7,35, 35,35,35 ]
		room.walls  = [ 25,15,25, 0,0,0 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nestorine
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:94, to_x: 0, to_y:-1))
		all[97] = room
	}
	
	func createNemedique()
	{
		var room = Room()
		
		room = Room()
		room.floors = [ 10,10,10, 5,4,6, 10,10,10 ]
		room.walls  = [ 18,29,18, 18,12,18 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.nemedique
		room.theme  = Theme.white
		room.addEvent(Wizard(x: -1, y: 1, spell: Personas.nestorine, orientation: .r, requiresPillar:true))
//		room.addEvent(Wizard(x: 0, y: 2, requirement: Personas.End))
		room.addEvent(Door(x: 2, y: 0, room:101, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, requirement: Personas.nemedique, room:9, to_x:0, to_y:1))
		all[100] = room
		
		room = Room()
		room.floors = [ 10,5,10, 10,6,6, 10,10,6 ]
		room.walls  = [ 18,13,18, 18,4,18 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.nemedique
		room.theme  = Theme.white
		room.addEvent(ramen_nemedique)
		room.addEvent(Door(x: 0, y: 2, room:102, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, requirement: Personas.necomedre, room:103, to_x:-1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:100, to_x: 1, to_y:0))
		all[101] = room
		
		room = Room()
		room.floors = [ 10,5,10, 5,5,10, 10,10,10 ]
		room.walls  = [ 18,18,18, 18,18,18 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.nemedique
		room.theme  = Theme.white
		room.addEvent(Shark(x: 0, y: 1, orientation:.r))
//		room.addEvent(Door(x: 2, y: 0, requirement: Personas.photoBooth))
		room.addEvent(Door(x: 0, y: -2, room:101, to_x: 0, to_y:1))
		all[102] = room
		
		room = Room()
		room.floors = [ 33,2,33, 2,4,2, 33,33,2 ]
		room.walls  = [ 3,31,3, 3,31,3 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.red
		room.addEvent(pillar_nemedique)
		room.addEvent(Door(x: -2, y: 0, requirement: Personas.necomedre, room:101, to_x:1, to_y:0))
		all[103] = room
		
		room = Room()
		room.floors = [ 41,42,43, 48,45,46, 47,49,44 ]
		room.walls  = [ 39,33,39, 39,33,39 ]
		room.steps  = [ 0,0,0, 0,11,0 ]
		room.audio  = Soundtrack.nepturne
		room.theme  = Theme.black
		room.addEvent(Red(x: 0, y: 1))
		all[104] = room
		
		room = Room()
		room.floors = [ 3,3,3, 3,7,3, 3,3,3 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 0,6,0, 0,0,0 ]
		room.audio  = Soundtrack.warp
		room.theme  = Theme.white
		room.addEvent(Teleport(x: 0, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:101, to_x: 1, to_y:0))
		all[105] = room
		
		room = Room()
		room.floors = [ 40,40,40, 40,8,40, 40,40,40 ]
		room.walls  = [ 29,29,29, 29,29,29 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nepturne
		room.theme  = Theme.black
		room.addEvent(Door(x: -1, y: 2, room:107, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 0, y: 2, room:107, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 1, y: 2, room:107, to_x: 1, to_y:-1))
		room.addEvent(Door(x: 2, y: 1, room:107, to_x: -1, to_y:1))
		room.addEvent(Door(x: 2, y: 0, room:107, to_x: -1, to_y:0))
		room.addEvent(Door(x: 2, y: -1, room:107, to_x: -1, to_y:-1))
		all[106] = room
		
		room = Room()
		room.floors = [ 40,40,40, 40,40,40, 40,40,40 ]
		room.walls  = [ 29,29,29, 29,29,29 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nepturne
		room.theme  = Theme.black
//		room.addEvent(Wizard(x: 0, y: 0, spell: credit1))
		room.addEvent(Door(x: -1, y: 2, room:108, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 0, y: 2, room:108, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 1, y: 2, room:108, to_x: 1, to_y:-1))
		room.addEvent(Door(x: 2, y: 1, room:108, to_x: -1, to_y:1))
		room.addEvent(Door(x: 2, y: 0, room:108, to_x: -1, to_y:0))
		room.addEvent(Door(x: 2, y: -1, room:108, to_x: -1, to_y:-1))
		all[107] = room
		
		room = Room()
		room.floors = [ 40,40,40, 40,40,40, 40,40,40 ]
		room.walls  = [ 29,29,29, 29,29,29 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nepturne
		room.theme  = Theme.black
//		room.addEvent(Wizard(x: 0, y: 0, spell: credit2))
		room.addEvent(Door(x: -1, y: 2, room:109, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 0, y: 2, room:109, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 1, y: 2, room:109, to_x: 1, to_y:-1))
		room.addEvent(Door(x: 2, y: 1, room:109, to_x: -1, to_y:1))
		room.addEvent(Door(x: 2, y: 0, room:109, to_x: -1, to_y:0))
		room.addEvent(Door(x: 2, y: -1, room:109, to_x: -1, to_y:-1))
		all[108] = room
		
		room = Room()
		room.floors = [ 33,33,33, 33,33,33, 33,33,33 ]
		room.walls  = [ 36,37,36, 36,37,36 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nepturne
		room.theme  = Theme.white
//		room.addEvent(Wizard(x: 0, y: 0, spell: endReset))
		all[109] = room
	}
	
	func createNastazie()
	{
		var room = Room()
	
		room = Room()
		room.floors = [ 36,39,36, 39,8,39, 36,36,39 ]
		room.walls  = [ 30,99,100, 99,30,99 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nastazie))
		room.addEvent(Door(x: -1, y: 2, room:131, to_x: -1, to_y:-1))
//		room.addEvent(Door(x: 2, y: 0, requirement: Personas.nastazie))
		all[130] = room
		
		room = Room()
		room.floors = [ 101,10,101, 10,9,10, 101,101,10 ]
		room.walls  = [ 101,30,101, 101,30,101 ]
		room.steps  = [ 0,0,0, 3,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Blocker(x: 1, y: 1, id:30))
		room.addEvent(Door(x: 0, y: 2, room:142, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:133, to_x: -1, to_y:0))
		room.addEvent(Door(x: -1, y: -2, room:130, to_x: 1, to_y:1))
		all[131] = room
		
		room = Room()
		room.floors = [ 36,39,9, 39,32,10, 36,10,39 ]
		room.walls  = [ 99,99,30, 99,99,19 ]
		room.steps  = [ 3,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.nemedique))
		room.addEvent(Door(x: 1, y: 2, room:143, to_x: 1, to_y:-1))
		room.addEvent(Door(x: -2, y: 1, room:140, to_x: 1, to_y:1))
		all[132] = room
		
		room = Room()
		room.floors = [ 36,39,10, 39,32,9, 36,10,39 ]
		room.walls  = [ 99,29,99, 99,19,101 ]
		room.steps  = [ 0,3,0, 0,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.neomine))
		room.addEvent(Door(x: 0, y: 2, room:142, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: 0, room:139, to_x: 1, to_y:0))
		all[133] = room
		
		room = Room()
		room.floors = [ 36,39,10, 39,32,10, 36,9,39 ]
		room.walls  = [ 12,99,99, 99,99,99 ]
		room.steps  = [ 0,0,3, 0,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
//		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.nephtaline, room:71, to_x:0, to_y:0))
		room.addEvent(Door(x: -1, y: 2, room:141, to_x: -1, to_y:-1))
		room.addEvent(Door(x: -2, y: -1, room:138, to_x: -1, to_y:-1))
		all[134] = room
		
		room = Room()
		room.floors = [ 36,39,36, 10,31,39, 10,9,39 ]
		room.walls  = [ 99,99,12, 99,99,12 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 0, y: 1, spell: Personas.nemedique))
		room.addEvent(Door(x: 1, y: 2, room:143, to_x: 1, to_y:-1))
		room.addEvent(Door(x: 2, y: -1, room:134, to_x: -1, to_y:-1))
		all[135] = room
		
		room = Room()
		room.floors = [ 36,39,36, 9,19,39, 10,10,39 ]
		room.walls  = [ 99,29,99, 99,29,99 ]
		room.steps  = [ 0,0,0, 0,8,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nastazie))
		room.addEvent(Door(x: 0, y: 2, room:142, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:133, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:131, to_x: 0, to_y:1))
		all[136] = room
		
		room = Room()
		room.floors = [ 36,39,36, 10,31,39, 9,10,39 ]
		room.walls  = [ 30,99,99, 30,99,99 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Door(x: -1, y: 2, room:141, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 2, y: 1, room:132, to_x: -1, to_y:1))
		all[137] = room
		
		room = Room()
		room.floors = [ 10,39,36, 39,8,39, 9,36,10 ]
		room.walls  = [ 25,14,25, 99,99,29 ]
		room.steps  = [ 0,0,0, 8,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nemedique))
		room.addEvent(Door(x: 0, y: 2, room:142, to_x: 0, to_y:-1))
		room.addEvent(Door(x: 2, y: -1, room:134, to_x: -1, to_y:-1))
		room.addEvent(Door(x: -1, y: -2, room:137, to_x: 1, to_y:1))
		all[138] = room
		
		room = Room()
		room.floors = [ 10,39,36, 39,17,39, 10,36,9 ]
		room.walls  = [ 30,99,100, 99,29,99 ]
		room.steps  = [ 0,8,0, 0,8,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.neomine))
		room.addEvent(Door(x: -1, y: 2, room:141, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 2, y: 0, room:133, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:131, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:136, to_x: 0, to_y:1))
		all[139] = room
		
		room = Room()
		room.floors = [ 9,39,36, 39,8,39, 10,36,10 ]
		room.walls  = [ 12,99,99, 12,99,99 ]
		room.steps  = [ 0,0,0, 0,0,8 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.nephtaline))
		room.addEvent(Door(x: -1, y: 2, room:141, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 2, y: 1, room:132, to_x: -1, to_y:1))
		room.addEvent(Door(x: 1, y: -2, room:135, to_x: 1, to_y:1))
		all[140] = room
		
		room = Room()
		room.floors = [ 9,10,10, 39,33,39, 36,36,39 ]
		room.walls  = [ 99,5,99, 99,99,99 ]
		room.steps  = [ 8,0,0, 8,0,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Blocker(x: 1, y: 1, id:30))
		room.addEvent(Door(x: 0, y: 2, requirement: Personas.nephtaline, room:144, to_x:0, to_y:-1))
		room.addEvent(Door(x: -2, y: 1, room:140, to_x: 1, to_y:1))
		room.addEvent(Door(x: -1, y: -2, room:137, to_x: 1, to_y:1))
		all[141] = room
		
		room = Room()
		room.floors = [ 10,9,10, 39,33,39, 36,36,39 ]
		room.walls  = [ 19,5,99, 99,99,99 ]
		room.steps  = [ 0,8,0, 0,8,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Blocker(x: 1, y: 1, id:30))
		room.addEvent(Door(x: 0, y: 2, requirement: Personas.neomine, room:145, to_x:0, to_y:-1))
//		room.addEvent(Door(x: 2, y: 0, requirement: Personas.PhotoBooth))
		room.addEvent(Door(x: -2, y: 0, room:139, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:136, to_x: 0, to_y:1))
		all[142] = room
		
		room = Room()
		room.floors = [ 10,10,9, 39,33,39, 36,36,39 ]
		room.walls  = [ 99,5,99, 99,99,99 ]
		room.steps  = [ 0,0,3, 0,0,8 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Blocker(x: 1, y: 1, id:30))
		room.addEvent(Door(x: 0, y: 2, requirement: Personas.nemedique, room:146, to_x:0, to_y:-1))
		room.addEvent(Door(x: -2, y: -1, room:138, to_x: -1, to_y:-1))
		room.addEvent(Door(x: 1, y: -2, room:135, to_x: 1, to_y:1))
		all[143] = room
		
		room = Room()
		room.floors = [ 36,39,3, 39,28,39, 36,36,39 ]
		room.walls  = [ 99,99,99, 99,99,99 ]
		room.steps  = [ 0,0,0, 0,8,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nastazie))
		room.addEvent(Door(x: 0, y: -2, room:141, to_x: 0, to_y:1))
		all[144] = room
		
		room = Room()
		room.floors = [ 36,39,36, 39,28,39, 36,36,39 ]
		room.walls  = [ 99,99,99, 99,99,99 ]
		room.steps  = [ 0,0,0, 0,8,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.nephtaline))
		room.addEvent(Door(x: 0, y: -2, room:142, to_x: 0, to_y:1))
		all[145] = room
		
		room = Room()
		room.floors = [ 36,39,36, 39,28,39, 36,36,39 ]
		room.walls  = [ 99,99,99, 99,99,99 ]
		room.steps  = [ 0,0,0, 0,8,0 ]
		room.audio  = Soundtrack.nastazie
		room.theme  = Theme.black
		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.neomine))
		room.addEvent(Door(x: 0, y: -2, room:143, to_x: 0, to_y:1))
		all[146] = room
		
		room = Room()
		room.floors = [ 101,39,101, 39,1,1, 101,101,1 ]
		room.walls  = [ 99,99,99, 99,100,99 ]
		room.steps  = [ 0,8,0, 0,0,0 ]
		room.audio  = Soundtrack.glitch
		room.theme  = Theme.red
		room.addEvent(pillar_nastazie)
		room.addEvent(Door(x: -2, y: 0, room:130, to_x: 1, to_y:0))
		all[147] = room
	}
	
	func createSecrets()
	{
		var room = Room()
		
		room = Room()
		room.floors = [ 1,1,1, 1,1,38, 1,1,38 ]
		room.walls  = [ 31,30,31, 33,31,33 ]
		room.steps  = [ 0,0,3, 0,0,0 ]
		room.audio  = Soundtrack.neomine
		room.theme  = Theme.black
		room.addEvent(Blocker(x: -1, y: 1, id:19))
		room.addEvent(Blocker(x: 1, y: 1, id:19))
		room.addEvent(Wizard(x: 1, y: 0, spell: Personas.nestorine))
		room.addEvent(Door(x: 0, y: 2, room:111, to_x: 0, to_y:-1))
		room.addEvent(Door(x: -2, y: -1, room:60, to_x: -1, to_y:-1))
		all[110] = room
		
		room = Room()
		room.floors = [ 36,36,36, 36,36,36, 36,36,36 ]
		room.walls  = [ 31,31,31, 31,31,31 ]
		room.steps  = [ 0,0,0, 0,3,0 ]
		room.audio  = Soundtrack.purgatory
		room.theme  = Theme.black
		//		room.addEvent(Wizard(x: 0, y: 1, spell: petunia))
//		room.addEvent(Wizard(x: 1, y: 1, spell: Personas.catfishbird))
		room.addEvent(Door(x: 2, y: 0, room:118, to_x: -1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:110, to_x: 0, to_y:1))
		all[111] = room
		
		room = Room()
		room.floors = [ 32,0,5, 6,0,4, 4,5,30 ]
		room.walls  = [ 3,0,13, 3,3,3 ]
		room.steps  = [ 0,0,7, 0,0,0 ]
		room.audio  = Soundtrack.nephtaline
		room.theme  = Theme.white
//		room.addEvent(Wizard(x: -1, y: 1, spell: Personas.catfishbird))
		room.addEvent(Door(x: 1, y: 2, room:41, to_x: 1, to_y:-1))
		//		room.addEvent(Door(x: 2, y: 0, requirement: Personas.catfishbird))
		room.addEvent(Door(x: -2, y: -1, room:43, to_x: -1, to_y:-1))
		all[112] = room
		
		room = Room()
		room.floors = [ 1,1,1, 1,1,1, 1,1,1 ]
		room.walls  = [ 1,1,1, 1,1,1 ]
		room.steps  = [ 0,1,0, 0,1,0 ]
		room.audio  = Soundtrack.endless
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: 2, room:113, to_x: 0, to_y:-1))
		//		room.addEvent(Wizard(x: 2, y: 1, spell: shuffleRoom))
		room.addEvent(Door(x: 2, y: 0, room:113, to_x: -1, to_y:0))
		room.addEvent(Door(x: -2, y: 0, room:112, to_x: 1, to_y:0))
		room.addEvent(Door(x: 0, y: -2, room:113, to_x: 0, to_y:1))
		all[113] = room
		
		// Glitch in nestorine(unused)
		
		room = Room()
		room.floors = [ 99,99,99, 99,99,99, 99,99,99 ]
		room.walls  = [ 0,0,0, 0,0,0 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.glitch
		room.theme  = Theme.white
		room.addEvent(Door(x: 0, y: -2, room:86, to_x: 0, to_y:1))
		all[114] = room
		
		// Glitch in nemedique
		
		room = Room()
		room.floors = [ 98,97,98, 98,31,97, 97,98,98 ]
		room.walls  = [ 15,98,1, 98,0,0 ]
		room.steps  = [ 0,0,0, 0,98,0 ]
		room.audio  = Soundtrack.play
		room.theme  = Theme.pest
		room.addEvent(Door(x: 0, y: -2, room:100, to_x: 0, to_y:1))
		all[115] = room
		
		// Courtyard
		
		room = Room()
		room.floors = [ 4,5,6, 6,33,4, 4,5,5 ]
		room.walls  = [ 36,13,36, 3,37,3 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.white
//		room.addEvent(Wizard(x: 0, y: 0, spell: Personas.catfishbird))
		room.addEvent(Door(x: 0, y: 2, room:9, to_x: 0, to_y:-1))
		all[116] = room
		
		// Extra Warp Zone
		
		room = Room()
		room.floors = [ 9,10,9, 10,7,10, 9,9,10 ]
		room.walls  = [ 36,36,36, 36,36,36 ]
		room.steps  = [ 0,0,0, 0,0,0 ]
		room.audio  = Soundtrack.pillar
		room.theme  = Theme.white
		room.addEvent(Teleport(x: 0, y: 0))
		all[117] = room
		
		// Daniel Room
		
		room = Room()
		room.floors = [ 31,29,31, 29,50,29, 31,31,29 ]
		room.walls  = [ 34,37,34, 35,37,35 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.glitch
		room.theme  = Theme.red
		//		room.addEvent(Wizard(x: 1, y: 0, spell: daniel))
		room.addEvent(Door(x: -2, y: 0, room:111, to_x: 1, to_y:0))
		all[118] = room
		
		// Hiversaires Room
		
		room = Room()
		room.floors = [ 109,107,105, 110,0,106, 112,108,111 ]
		room.walls  = [ 102,103,102, 0,0,0 ]
		room.steps  = [ 0,0,0, 0,7,0 ]
		room.audio  = Soundtrack.glitch
		room.theme  = Theme.void
//		room.addEvent(Blocker(x: 0, y: -1, id:999))
		//		room.addEvent(Wizard(x: 0, y: 0, spell: sauvegarde))
		room.addEvent(Blocker(x: 1, y: 0, id:29))
//		room.addEvent(Blocker(x: -1, y: -1, id:999))
//		room.addEvent(Blocker(x: -1, y: 0, id:999))
		room.addEvent(Door(x: 0, y: -2, room:68, to_x: 0, to_y:1))
		all[148] = room
		
		// Photobooth #1 - Lobby
		
		room = Room()
		room.floors = [ 4,5,6, 5,18,4, 6,4,5 ]
		room.walls  = [ 19,19,36, 36,37,36 ]
		room.steps  = [ 0,7,0, 0,0,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.white
		room.addEvent(Blocker(x: -1, y: 1, id:30))
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:3, to_x: 1, to_y:0))
		all[149] = room
		
		// Photobooth #2 - Necomedre
		
		room = Room()
		room.floors = [ 33,21,21, 21,18,21, 33,21,33 ]
		room.walls  = [ 20,21,20, 20,21,20 ]
		room.steps  = [ 0,0,0, 7,0,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.white
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: -1, y: -2, room:37, to_x: 1, to_y:1))
		all[150] = room
		
		// Photobooth #3 - Nephtaline
		
		room = Room()
		room.floors = [ 1,1,1, 1,18,1, 1,1,1 ]
		room.walls  = [ 25,2,25, 25,31,25 ]
		room.steps  = [ 0,0,0, 0,8,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.void
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: 0, y: -2, room:46, to_x: 0, to_y:1))
		all[151] = room
		
		// Photobooth #4 - Neomine
		
		room = Room()
		room.floors = [ 36,3,36, 3,18,3, 36,36,3 ]
		room.walls  = [ 0,0,0, 31,30,31 ]
		room.steps  = [ 0,0,0, 0,8,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.red
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: 0, y: -2, room:66, to_x: 0, to_y:1))
		all[152] = room
		
		// Photobooth #5 - Nestorine
		
		room = Room()
		room.floors = [ 1,35,34, 35,18,35, 1,34,34 ]
		room.walls  = [ 35,34,37, 37,34,35 ]
		room.steps  = [ 0,8,0, 0,0,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.black
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:89, to_x: 1, to_y:0))
		all[153] = room
		
		// Photobooth #6 - Nemedique
		
		room = Room()
		room.floors = [ 36,32,36, 32,18,32, 36,36,32 ]
		room.walls  = [ 25,25,25, 2,29,2 ]
		room.steps  = [ 0,8,0, 0,0,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.white
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:102, to_x: 1, to_y:0))
		all[154] = room
		
		// Photobooth #7
		
		room = Room()
		room.floors = [ 33,35,35, 33,101,35, 33,35,33 ]
		room.walls  = [ 101,101,101, 101,100,101 ]
		room.steps  = [ 0,8,0, 0,0,0 ]
		room.audio  = Soundtrack.photobooth
		room.theme  = Theme.void
		room.addEvent(Kamera(x: 1, y: 0))
		room.addEvent(Door(x: -2, y: 0, room:142, to_x: 1, to_y:0))
		all[155] = room
	}
}