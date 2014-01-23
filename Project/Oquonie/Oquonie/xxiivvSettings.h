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
#define userCharacterLocation	37
#define userCharacterX			0
#define userCharacterY			0

#define storageQuestRamenNecomedre		1
#define storageQuestRamenNephtaline		2
#define storageQuestRamenNeomine		3
#define storageQuestRamenNestorine		4
#define storageQuestRamenNemedique		5

#define storageQuestPillarNecomedre		11
#define storageQuestPillarNephtaline	12
#define storageQuestPillarNeomine		13
#define storageQuestPillarNestorine		14
#define storageQuestPillarNemedique		15

#define dialogHaveCharacterNot(x)	[NSString stringWithFormat:@"UU%@",x];

#define dialogGainSpell(x)			[NSString stringWithFormat:@"UU%@",x];
#define dialogGainPillar			@"UUU"

#define dialogRamenFound			@"UUU"
#define dialogRamenNotFound			@"UUU"

#define dialogSharkHelp				@"UUU"
#define dialogSharkTransform		@"UUU"

#define dialogMapHelp				@"UUU"

#define dialogWarpLobby				@"FLT"

#define dialogTutorialTalk1			@"UUU"
#define dialogTutorialTalk2			@"UUU"
#define dialogTutorialTalk3			@"UUU"

#define dialogConfusion1			@"UUU"
#define dialogConfusion2			@"UUU"
#define dialogConfusion3			@"UUU"
#define dialogConfusion4			@"UUU"

#define dialogHaveCharacter			@"SIO" // already are the character from that wizard
#define dialogHaveSpell				@"SIO" // already have the spell from that wizard

#define dialogInfoPillar			@"UUU"

#define dialogAudioOn				@"UUU"
#define dialogAudioOff				@"UUU"

#define audioQuiet				@"Quiet"
#define audioNecomedre			@"Necomedre"
#define audioNephtaline			@"Nephtaline"
#define audioNeomine			@"Neomine"
#define audioNestorine			@"Nestorine"
#define audioNemedique			@"Nemedique"
#define audioQuiet				@"Quiet"
#define audioPillar				@"Pillar"
#define audioLobby				@"Town"

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
#define locationNeominePillar		@"71"
#define locationNeomineRamen		@"63"

#define locationNestorineLobby		@"7"
#define locationNestorineEnter		@"96"
#define locationNestorinePillar		@"90"
#define locationNestorineRamen		@"88"

#define locationNecomedrePillar		@"120"
#define locationNecomedreLobby		@"5"
#define locationNecomedreRamen		@"35"

#define locationNephtalineLobby		@"1"
#define locationNephtalinePillar	@"121"
#define locationNephtalineRamen		@"57" // TODO

#define locationNemediqueLobby		@"9"
#define locationNemediqueEnter		@"100"
#define locationNemediqueRamen		@"101"
#define locationNemediquePillar		@"103"

#define roomCenter				@"0,0"

#define intStr() [NSString stringWithFormat:@"%d",int]

#define userLocationString		[NSString stringWithFormat:@"%d",userLocation]
#define userPositionString		[NSString stringWithFormat:@"%d,%d",userPositionX,userPositionY]

#define MARK	CMLog(@"%s", __PRETTY_FUNCTION__);
#define CMLog(format, ...) NSLog(@"%s:%@", __PRETTY_FUNCTION__,[NSString stringWithFormat:format, ## __VA_ARGS__]);

#define test(x) NSLog(@"%@",x);
//#define dialogString(x) [NSString stringWithFormat:@"%@",x];


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