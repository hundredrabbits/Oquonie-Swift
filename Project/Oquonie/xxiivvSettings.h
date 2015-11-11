
#import "User.h"
#import "World.h"
#import "Room.h"
#import "Tile.h"

#define systemDebug				0
#define systemBuild				1

#define storageQuestRamenNecomedre		1
#define storageQuestRamenNephtaline		2
#define storageQuestRamenNeomine		3
#define storageQuestRamenNestorine		4
#define storageQuestRamenNemedique		5

#define storageGhostOffice				6
#define storageGhostNecomedre			7
#define storageGhostNephtaline			8
#define storageGhostNeomine				9
#define storageGhostNestorine			10

#define storageQuestPillarNecomedre		11
#define storageQuestPillarNephtaline	12
#define storageQuestPillarNeomine		13
#define storageQuestPillarNestorine		14
#define storageQuestPillarNemedique		15
#define storageQuestPillarHiversaires	16

#define storageEndForm					20
#define storageEndFormTrigger			21
#define spawnLocation					29

#define dialogIntroduction			@"KIO"
#define dialogHaveCharacter			@"QIS" // already are the character from that wizard
#define dialogHaveSpell				@"PIR" // already have the spell from that wizard
#define dialogHaveCharacterNot(x)	[NSString stringWithFormat:@"GL%@",x];

#define dialogGainSpell(x)			[NSString stringWithFormat:@"RP%@",x];
#define dialogGainPillar			@"RQY"
#define dialogGainRamen				@"RQO"
#define dialogHaveRamenNot			@"OQT"
#define dialogHavePillars			@"PIY"
#define dialogHavePillarsNot		@"YQT"

#define dialogEnd1					@"HIS"

#define dialogSharkHelp				@"QJT"
#define dialogSharkTransform		@"SID"

#define dialogMapHelp				@"MKQ"

#define dialogWarpLobby				@"MHS"

#define dialogInfoPillar			@"YIS"

#define dialogAudioOn				@"NQI"
#define dialogAudioOff				@"NQJ"

#define dialogTutorialTalk1			@"HIS"
#define dialogTutorialTalk2			@"HIS"
#define dialogTutorialTalk3			@"HIS"
#define dialogNoFace				@"USV"

#define dialogConfusion1			@"UVW"
#define dialogConfusion2			@"WUV"
#define dialogConfusion3			@"VUW"

#define dialogOwlSave				@"PRL"
#define dialogHiversaires			@"789"

#define tagBlockers                 470
#define tagNotifications            490
#define tagCharacter                495

#define audioRekka				@"rekka"
#define audioDevine				@"devine"

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
#define eventNepturne			@"28"
#define eventCat				@"33"
#define eventNoFace				@"29"
#define eventNastazie			@"35"
#define eventHiversaires		@"36"
#define eventKamera             @"37"

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
#define spellCat				7
#define spellNastazie			8

#define letterNecomedre			@"D"
#define letterNephtaline		@"C"
#define letterNeomine			@"E"
#define letterNestorine			@"B"
#define letterNemedique			@"A"
#define letterNastazie			@"F"
#define letterDocument			@"X"
#define letterAudio				@"N"
#define letterHelp				@"M"
#define letterConfused			@"U"
#define letterUnlocked			@"K"
#define letterPillar			@"Y"
#define letterGuide				@"O"
#define letterCat				@"7"

#define locationLobbyLanding		1
#define locationGameStart			29

#define locationNeomineLobby		3
#define locationNeominePillar		71
#define locationNeomineRamen		63

#define locationNestorineLobby		7
#define locationNestorineEnter		96
#define locationNestorinePillar		90
#define locationNestorineRamen		88

#define locationNecomedrePillar		120
#define locationNecomedreLobby		5
#define locationNecomedreRamen		35

#define locationNephtalineLobby		1
#define locationNephtalinePillar	121
#define locationNephtalineRamen		57

#define locationNemediqueLobby		9
#define locationNemediqueEnter		100
#define locationNemediqueRamen		101
#define locationNemediquePillar		103