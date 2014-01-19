//
//  xxiivvViewController+settings.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#define systemDebug				1
#define systemBuild				1

#define userCharacterId			1
#define userCharacterLocation	29
#define userCharacterX			0
#define userCharacterY			0

#define userQuestRamen			0

#define storageAudio					1
#define storageQuestRamen				5
#define storageQuestPillarNecomedre		11
#define storageQuestPillarNephtaline	12
#define storageQuestPillarNeomine		13
#define storageQuestPillarNestorine		14
#define storageQuestPillarNemedique		15

#define dialogHaveCharacter			@"SIO"
#define dialogHaveSpell				@"SIO"
#define dialogGiveSpellNecomedre	@"MDK"
#define dialogGiveSpellNeomine		@"MEK"
#define dialogGiveSpellDocument		@"MXK"
#define dialogGiveSpellNemedique	@"MAK"
#define dialogGiveSpellNephtaline	@"MCK"
#define dialogGiveSpellNestorine	@"MBK"
#define dialogDoorLocked			@"FLT"
#define dialogAudioOn				@"UUU"
#define dialogAudioOff				@"UUU"
#define dialogThankYou				@"UUU"
#define dialogConfusion				@"UUU"
#define dialogSeeYou				@"UUU"
#define dialogWarpLobby				@"FLT"
#define dialogTakePillar			@"UUU"
#define dialogInfoPillar			@"UUU"
#define dialogLookMap				@"UUU"
#define dialogFoundPillar			@"UUU"

#define characterNecomedre		1
#define characterNephtaline		2
#define characterNeomine		3
#define characterNestorine		4
#define characterNemedique		5
#define characterDocument		6

#define eventNecomedre			@"2"
#define eventNephtaline			@"3"
#define eventNeomine			@"4"
#define eventNestorine			@"5"
#define eventNemedique			@"6"
#define eventOwl				@"1"
#define eventRamen				@"7"
#define eventShark				@"8"
#define eventPhotocopier		@"11"
#define eventAudio				@"9"
#define eventTutorial			@"12"
#define eventRed				@"10"
#define eventRamenSeat			@"18"

#define eventPillarCollectible	@"15"
#define eventPillarSocket		@"14"
#define eventPillarAssembled	@"16"
#define eventPillarRemains		@"17"

#define spellNecomedre			1
#define spellNephtaline			2
#define spellNeomine			3
#define spellNestorine			4
#define spellNemedique			5
#define spellDocument			6

#define letterNecomedre			@"D"
#define letterNephtaline		@"C"
#define letterNeomine			@"E"
#define letterNestorine			@"B"
#define letterNemedique			@"A"
#define letterDocument			@"X"
#define letterAudio				@"N"
#define letterHelp				@"M"
#define letterConfused			@"U"
#define letterUnlocked			@"K"
#define letterPillar			@"Y"

#define locationLobbyLanding		@"1"
#define locationGameStart			@"29"
#define locationNeomineLobby		@"3"
#define locationNestorineLobby		@"7"
#define locationNestorineEnter		@"80"
#define locationNecomedrePillar		@"120"
#define locationNeominePillar		@"71"
#define locationNecomedreLobby		@"5"
#define locationNephtalineLobby		@"1"
#define locationNephtalinePillar	@"121"
#define locationNemediqueLobby		@"9"
#define locationNemediqueEnter		@"100"

#define roomCenter				@"0,0"

#define intStr() [NSString stringWithFormat:@"%d",int]

#define userLocationString		[NSString stringWithFormat:@"%d",userLocation]
#define userPositionString		[NSString stringWithFormat:@"%d,%d",userPositionX,userPositionY]

/*
 
 # tags
 
 30 notifications
 
 # World IDs
 
 == + =========== + ================== + ============================
 id | Location    | Event Name         | Notes
 == + =========== + ================== + ============================
 
 1  | Lobby
 
 20 | Necomedre 29/32
	-> Game Start: 29
	-> Necomedre World: 32
 
 40 | Nephtaline
 
 60 | Neomine
 
 80 | Nestorine
 
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
 */