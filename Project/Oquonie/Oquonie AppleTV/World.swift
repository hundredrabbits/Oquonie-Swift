
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import Foundation

class World
{
	var all:Array<Room>!
	
	init()
	{
		all = []
	
		var room = Room()
		
		room = Room()
		room.floors = [ 0,25,2, 2,8,4, 2,2,2 ]
		room.walls  = [ 0,5,2,2,12,15 ]
		room.steps  = [ 0,0,0,0,0,0 ]
		room.audio  = Soundtrack.lobby
		room.theme  = Theme.white
		room.addEvent(Blocker(x:1,y:1,id:10))
		
		all.append(room)
		
		/*
		
		@"0",@"25",@"2|block|10",
		@"2",@"8",@"4",
		@"2",@"2",@"2|event|socket|14|l",
		// Walls
		@"0",@"5|event|gateNephtaline",@"2",@"2",@"12|warp|2|0,-1",@"15",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Entrance",@"White",audioLobby];
		
		*/
		
	}
}