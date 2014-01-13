//
//  xxiivvViewController+settings.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#define systemDebug				1

#define userCharacterId			2
#define userCharacterLocation	40
#define userCharacterX			0
#define userCharacterY			0

#define dialogHaveCharacter			@"SIO"
#define dialogHaveSpell				@"SIO"
#define dialogGiveSpellNecomedre	@"MDK"
#define dialogGiveSpellNeomine		@"MEK"
#define dialogDoorLocked			@"FLT"

#define userLocationString		[NSString stringWithFormat:@"%d",userLocation]
#define userPositionString		[NSString stringWithFormat:@"%d,%d",userPositionX,userPositionY]

/*
 # Event IDs
 == + =========== + ================== + ============================
 id | Location    | Event Name         | Notes
 == + =========== + ================== + ============================
 1  | Settings    | audioToggle        | 1 = on
 2  | Settings    |
 3  | Settings    |
 4  | Settings    |
 5  | Pillar      | Neomine			   | 1 = on
 6  | Settings    |
 7  | Settings    |
 8  | Settings    |
 9  | Settings    |
 == + =========== + ================== + ============================
 
 50 | spellgiver  | nephtaline
 
 
 # Alphabet
 == + =========== + ================== + ============================
 A | Nemedique
 B | Nepomucene
 C | Nephtaline
 D | Necomedre
 K | Unlocked
 L | Locked
 F | Door
 N | Audio
 X | Document
 */