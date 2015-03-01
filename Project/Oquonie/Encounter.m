//
//  Encounter.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Encounter.h"
#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

@implementation Encounter

-(Encounter*)init
{
    NSLog(@"+ ENCNT | Init");
    newDraw = [[Draw alloc] init];
    return self;
}

-(Encounter*)initWithName :(NSString*)name
{
    encounterName = name;
    return self;
}

-(void)touch
{
    SEL targetSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:",encounterName]);
    [self performSelector:targetSelector withObject:@"touch"];
	[newDraw bumpEvent:encounterName];
}

-(NSString*)see
{
	SEL targetSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:",encounterName]);
	return [self performSelector:targetSelector withObject:@"postUpdate"];
}

-(NSString*)notify
{
	SEL targetSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:",encounterName]);
	return [self performSelector:targetSelector withObject:@"postNotification"];
}

# pragma mark Lobby -

-(NSString*)socket :(NSString*)option
{
	int socketInstanceStorageId = 0;
	
	if([user location] == locationNeomineLobby ){
		socketInstanceStorageId = storageQuestPillarNeomine;
	}
	else if([user location] == locationNestorineLobby ){
		socketInstanceStorageId = storageQuestPillarNestorine;
	}
	else if([user location] == locationNecomedreLobby ){
		socketInstanceStorageId = storageQuestPillarNecomedre;
	}
	else if([user location] == locationNephtalineLobby ){
		socketInstanceStorageId = storageQuestPillarNephtaline;
	}
	else if([user location] == locationNemediqueLobby ){
		socketInstanceStorageId = storageQuestPillarNemedique;
	}
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user eventExists:socketInstanceStorageId]){
			return eventPillarAssembled;
		}
		return eventPillarSocket;
	}
	// Dialogs
	if([user eventExists:socketInstanceStorageId]){
		[newDraw dialog:dialogInfoPillar:eventOwl];
	}
	[[[Audio alloc] init] effect:@"bump1"];
	
	// Default
	return @"";
}

-(NSString*)tree :(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        
        // count pillars
        int count = 0;
        if([user eventExists:storageQuestPillarNecomedre]){ count += 1; }
        if([user eventExists:storageQuestPillarNemedique]){ count += 1; }
        if([user eventExists:storageQuestPillarNeomine]){ count += 1; }
        if([user eventExists:storageQuestPillarNephtaline]){ count += 1; }
        if([user eventExists:storageQuestPillarNestorine]){ count += 1; }
        
        if(count == 0){ return @"23";}
        if(count == 1){ return @"24";}
        if(count == 2){ return @"25";}
        if(count == 3){ return @"26";}
        if(count >  3){ return @"27";}
        
        return @"";
    }
    // Default
    return @"";
}

-(NSString*)ramen :(NSString*)option
{
    int ramenStorage = 0;
    
    if( [user location] == locationNestorineRamen){
        ramenStorage = storageQuestRamenNestorine;
    }
    else if( [user location] == locationNeomineRamen){
        ramenStorage = storageQuestRamenNeomine;
    }
    else if( [user location] == locationNecomedreRamen){
        ramenStorage = storageQuestRamenNecomedre;
    }
    else if( [user location] == locationNephtalineRamen){
        ramenStorage = storageQuestRamenNephtaline;
    }
    else if( [user location] == locationNemediqueRamen){
        ramenStorage = storageQuestRamenNemedique;
    }
    // Broadcast Notifications
    if([option isEqualToString:@"postNotification"]){
        if(![user eventExists: ramenStorage]){
            return letterGuide;
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        // Completed
        if([user eventExists: ramenStorage]){
            return eventRamenSeat;
        }
        else{
            return eventRamen;
        }
    }
    
    // Dialogs
    if(![user eventExists: ramenStorage]){
        [user eventCollect:ramenStorage];
		[[[Audio alloc] init] dialog:@"ramen"];
		[newDraw dialog:dialogGainRamen:eventRamen];
		
        [newDraw sequenceRamen];
    }
	else{
		[[[Audio alloc] init] effect:@"bump"];
	}
    
    return @"";
}

-(NSString*)ramenLobby :(NSString*)option
{
    int ramenStorage = 0;
    NSString* saySpell;
    int giveSpell = 0;
    
    // Characters Settings
    if([user character] == characterNestorine){
        ramenStorage = storageQuestRamenNestorine;
        saySpell = letterNephtaline;
        giveSpell = spellNephtaline;
    }
    else if([user character] == characterNephtaline){
        ramenStorage = storageQuestRamenNephtaline;
        saySpell = letterNemedique;
        giveSpell = spellNemedique;
    }
    else if([user character] == characterNecomedre){
        ramenStorage = storageQuestRamenNecomedre;
        saySpell = letterNestorine;
        giveSpell = spellNestorine;
    }
    else if([user character] == characterNemedique){
        ramenStorage = storageQuestRamenNemedique;
        saySpell = letterNeomine;
        giveSpell = spellNeomine;
    }
    else if([user character] == characterNeomine){
        ramenStorage = storageQuestRamenNeomine;
        saySpell = letterNecomedre;
        giveSpell = spellNecomedre;
    }
    
    if( [user isFinished] ){
        return @"";
    }
    
    // Broadcast Notifications
    if([option isEqualToString:@"postNotification"]){
        if([user eventExists: ramenStorage] && ![user spellExists:@"ramenQuestSpell"] ){
            return saySpell;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        // Completed
        if([user eventExists: ramenStorage]){
            return eventRamen;
        }
        else{
            return eventRamenSeat;
        }
    }
    
    if([user eventExists: ramenStorage]){
		[render spellCollect:@"ramenQuestSpell":giveSpell];
		[[[Audio alloc] init] dialog:@"ramen"];
    }
	else{
		[[[Audio alloc] init] effect:@"bump"];
	}
    
    return @"";
}

-(NSString*)warpLobby :(NSString*)option
{
    // Broadcast Notifications
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
	
	[user setPosition:0 :0];
	[newDraw animateWalk];
	[newDraw sequenceWarpTo:1];
	
    return @"";
}

-(NSString*)speakerphone :(NSString*)option
{
    // Broadcast Notifications
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        if( [newSound isPlaying]){ return @"22"; }
        else{ return @"9"; }
    }
    
    // Dialogs
    if([newSound isPlaying]){
        [newSound start];
        [newDraw dialog:dialogAudioOn:eventAudio];
		[[[Audio alloc] init] dialog:@"speakerphone"];
    }
    else{
        [newSound stop];
        [newDraw dialog:dialogAudioOff:eventAudio];
		[[[Audio alloc] init] dialog:@"speakerphone"];
    }
	
	[newDraw notifications];
	
    return @"";
}

-(NSString*)pillar:(NSString*)option
{
	int pillarInstanceStorageId = 0;
	int pillarInstanceWarp = 0;
	
	if([user location] == locationNeominePillar ){
		pillarInstanceStorageId = storageQuestPillarNeomine;
		pillarInstanceWarp = locationNeomineLobby;
	}
	else if ([user location] == locationNecomedrePillar ){
		pillarInstanceStorageId = storageQuestPillarNecomedre;
		pillarInstanceWarp = locationNecomedreLobby;
	}
	else if ([user location] == locationNephtalinePillar ){
		pillarInstanceStorageId = storageQuestPillarNephtaline;
		pillarInstanceWarp = locationNephtalineLobby;
	}
	else if ([user location] == locationNestorinePillar ){
		pillarInstanceStorageId = storageQuestPillarNestorine;
		pillarInstanceWarp = locationNestorineLobby;
	}
	else if ([user location] == locationNemediquePillar ){
		pillarInstanceStorageId = storageQuestPillarNemedique;
		pillarInstanceWarp = locationNemediqueLobby;
	}
	// Hiversaires
	else if ([user location] == 147){
		pillarInstanceStorageId = storageQuestPillarHiversaires;
		pillarInstanceWarp = locationNeomineLobby;
	}
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if( [user eventExists: pillarInstanceStorageId]){
			return eventPillarRemains;
		}
		return @"";
	}
	
	// Dialog
	if(![user eventExists: pillarInstanceStorageId]){
		[user eventCollect:pillarInstanceStorageId];
		[[[Audio alloc] init] effect:@"bump"];
		[newDraw dialog:dialogGainPillar:eventOwl];
		// Clear Spellbook
		[user clearSpellbook];
		[user setPosition:0:0];
		[newDraw sequenceWarpTo:pillarInstanceWarp];
	}
	
	// Default
	return @"";
}


-(NSString*)shark :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if( [user eventExists:storageQuestPillarNemedique] && [user character] != 1){ return letterConfused;}
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	if([user eventExists: storageQuestPillarNemedique] || [user location] == 102){
		
		[[[Audio alloc] init] dialog:@"shark"];
		[newDraw dialog:dialogSharkHelp:eventShark];
		[newDraw animateTransform:1];
		[user setCharacter:1];
		[user setEnabled:0];
		
		// Clear Spellbook
		[user clearSpellbook];
	}
	else{
		[[[Audio alloc] init] dialog:@"shark"];
		[newDraw dialog:dialogSharkTransform:eventShark];
	}
	
	// Return storage Id
	return @"";
}

-(NSString*)map :(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }

    Draw * newDraw = [[Draw alloc] init];
    
    // Dialogs
    if([user location] == 32){ [newDraw map:@"necomedre"]; }
    if([user location] == 2 ){ [newDraw map:@"lobby"]; }
    if([user location] == 60){ [newDraw map:@"neomine"]; }
    if([user location] == 50){ [newDraw map:@"nephtaline"]; }
    if([user location] == 85){ [newDraw map:@"nestorine"]; }
	
	[[[Audio alloc] init] effect:@"click1"];
	
    // Default
    return @"";
}

-(NSString*)owlSave :(NSString*)option
{
    if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
    if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
    
    // Dialog
    [newDraw dialog:dialogOwlSave:eventOwl];
	[[[Audio alloc] init] dialog:@"owl"];
    [user save];
	[newDraw spellbookDisplay];
    
    // Return storage Id
    return @"";
}


-(NSString*)gateDocument :(NSString*)option
{
    NSString* eventDialogLocked = dialogHaveCharacterNot(letterDocument);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( [user character] == characterDocument && [user location] == 29 ){
            return letterDocument;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        if([user character]==characterDocument){
            return @"gateDocument.open";
        }
        else{
            return @"gateDocument.shut";
        }
    }
    
    // Warp
    if([user character] == characterDocument){
        if([user location] == 29){
            [render router:[[Event alloc] initWarp:30:0:-1]];
        }
        else if([user location] == 30){
            [render router:[[Event alloc] initWarp:29:0:1]];
        }
    }
    else{
        [newDraw dialog:eventDialogLocked:eventTutorial];
    }
    
    return @"";
}

-(NSString*)gateNephtaline :(NSString*)option
{
    NSString* eventDialogLocked = dialogHaveCharacterNot(letterNephtaline);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if([user character]==2 && [user eventExists:storageQuestPillarNemedique] && [user location] == 1 ){
            return letterUnlocked; // letterUnlocked
        }
        // Nestorine Pillar Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNestorine] && [user location] == 93 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNephtaline] && [user location] == 1 ){
            return letterPillar; // letterUnlocked
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        // Nemedique pillar
        if([user location] == 93 && [user eventExists:storageQuestPillarNestorine]){
            return @"19";
        }
        if([user character]==characterNephtaline || [user character] == 7){
            return @"gateNephtalineOpen";
        }
        else{
            return @"gateNephtalineClosed";
        }
    }
    
    // Nemedique pillar
    if([user location] == 93 && [user eventExists:storageQuestPillarNestorine]){
        return @"";
    }
    
    // Warp
    if([user character] == characterNephtaline || [user character] == 7){
        if([user location] == 38){
            [render router:[[Event alloc] initWarp:39:0:-1]];
        }
        else if([user location] == 39){
            [render router:[[Event alloc] initWarp:38:0:1]];
        }
        else if([user location] == 1){
            [render router:[[Event alloc] initWarp:40:-1:-1]];
        }
        else if([user location] == 40){
            [render router:[[Event alloc] initWarp:1:1:0]];
        }
        else if([user location] == 93){
            [render router:[[Event alloc] initWarp:90:-1:0]];
        }
        else if([user location] == 90){
            [render router:[[Event alloc] initWarp:93:1:0]];
        }
        // Nastalize
        else if([user location] ==	141){
            [render router:[[Event alloc] initWarp:144:-1:0]];
        }
        else if([user location] == 144){
            [render router:[[Event alloc] initWarp:141:1:0]];
        }
    }
    else{
        [newDraw dialog:eventDialogLocked:@"1"];
    }
    return @"";
}

-(NSString*)gateNeomine :(NSString*)option
{
    NSString* eventDialogLocked = dialogHaveCharacterNot(letterNeomine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if([user character]==3 && ![user eventExists:storageQuestPillarNemedique] && [user location] == 3 ){
            return letterUnlocked; // letterUnlocked
        }
        // Lobby Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNeomine] && [user location] == 3 ){
            return letterPillar; // letterUnlocked
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        if([user character]==characterNeomine || [user character] == 7 || [user character] == 8 ){
            return @"gateNeomineOpen";
        }
        else{
            return @"gateNeomineClosed";
        }
    }
	
    // Warp
    if([user character] == characterNeomine || [user character] == 7 || [user character] == 8){
        if([user location] == 60){
            [render router:[[Event alloc] initWarp:3:1:0]];
        }
        else if([user location] == 3){
            [render router:[[Event alloc] initWarp:60:-1:0]];
        }
        else if([user location] == 34){
            [render router:[[Event alloc] initWarp:71:-1:1]];
        }
        else if([user location] == 71){
            [render router:[[Event alloc] initWarp:34:1:1]];
        }
        else if([user location] == 58){
            [render router:[[Event alloc] initWarp:59:-1:0]];
        }
        else if([user location] == 59){
            [render router:[[Event alloc] initWarp:58:1:0]];
        }
        // Nastalize
        else if([user location] ==	142){
            [render router:[[Event alloc] initWarp:145:-1:0]];
        }
        else if([user location] == 145){
            [render router:[[Event alloc] initWarp:142:1:0]];
        }
    }
    else{
        [newDraw dialog:eventDialogLocked:@"1"];
    }
    return @"";
}

-(NSString*)gateNestorine :(NSString*)option
{
    NSString* eventDialogLocked = dialogHaveCharacterNot(letterNestorine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if([user character]==4 && ![user eventExists:storageQuestPillarNemedique] && [user location] == 7 ){
            return letterUnlocked; // letterUnlocked
        }
        // Necomedre Pillar Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNecomedre] && [user location] == 34 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNestorine] && [user location] == 7 ){
            return letterPillar; // letterUnlocked
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        // Condemned pillar doors: Neomine
        if([user location] == 34 && [user eventExists:storageQuestPillarNecomedre]){
            return @"25";
        }
        if([user character]==characterNestorine || [user character] == 7){
            return @"gateNestorineOpen";
        }
        else{
            return @"gateNestorineClosed";
        }
    }
    
    // Condemned pillar doors: Neomine
    if([user location] == 34 && [user eventExists:storageQuestPillarNecomedre]){
        return @"";
    }
    
    // Warp
    if([user character] == characterNestorine || [user character] == 7){
        if([user location] == 7){
            [render router:[[Event alloc] initWarp:96:0:-1]];
        }
        else if([user location] == locationNestorineEnter){
            [render router:[[Event alloc] initWarp:7:0:1]];
        }
        else if([user location] == 34){
            [render router:[[Event alloc] initWarp:120:-1:0]];
        }
        else if([user location] == 120){
            [render router:[[Event alloc] initWarp:34:1:0]];
        }
        else if([user location] == 69){
            [render router:[[Event alloc] initWarp:70:0:-1]];
        }
        else if([user location] == 70){
            [render router:[[Event alloc] initWarp:69:0:1]];
        }
    }
    else{
        [newDraw dialog:eventDialogLocked:@"1"];
    }
    
    return @"";
}

-(NSString*)gateNecomedre :(NSString*)option
{
    NSString* eventDialogLocked = dialogHaveCharacterNot(letterNecomedre);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if([user character]==1 && ![user eventExists:storageQuestPillarNemedique] && [user location] == 5 ){
            return letterUnlocked; // letterUnlocked
        }
        // Neomine Pillar Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNeomine] && [user location] == 62 ){
            return letterPillar;
        }
        // Nemedique Pillar Door
        if( ![user eventExists: storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNecomedre] && [user location] == 101 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNecomedre] && [user location] == 5 ){
            return letterPillar; // letterUnlocked
        }
        
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        
        // Nemedique pillar
        if([user location] == 101 && [user eventExists:storageQuestPillarNemedique]){
            return @"13";
        }
        // Neomine pillar
        else if([user location] == 62 && [user eventExists:storageQuestPillarNeomine]){
            return @"36";
        }
        else if([user character]==characterNecomedre || [user character] == 7){
            return @"gateNecomedreOpen";
        }
        else{
            return @"gateNecomedreClosed";
        }
    }
    
    // Condemned pillar doors: Nemedique
    if([user location] == 101 && [user eventExists:storageQuestPillarNemedique]){
        [render router:[[Event alloc] initWarp:105:0:-1]];
        return @"";
    }
    // Condemned pillar doors: Neomine
    if([user location] == 62 && [user eventExists:storageQuestPillarNeomine]){
        return @"";
    }
    
    // Warp
    if([user character] == characterNecomedre || [user character] == 7){
        if([user location] == 62){
            [render router:[[Event alloc] initWarp:71:0:-1]];
        }
        else if([user location] == 71){
            [render router:[[Event alloc] initWarp:62:0:1]];
        }
        else if([user location] == 5){
            [render router:[[Event alloc] initWarp:32:0:-1]];
        }
        else if([user location] == 32){
            [render router:[[Event alloc] initWarp:5:0:1]];
        }
        // Nemedique Pillar
        else if([user location] == 101){
            [render router:[[Event alloc] initWarp:103:0:-1]];
        }
        else if([user location] == 103){
            [render router:[[Event alloc] initWarp:101:0:1]];
        }
    }
    else{
        [newDraw dialog:eventDialogLocked:@"1"];
    }
    return @"";
}

-(NSString*)gateNemedique :(NSString*)option
{
    NSString* eventDialogLocked = dialogHaveCharacterNot(letterNemedique);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if([user character]==5 && ![user eventExists:storageQuestPillarNemedique] && [user location] == 9 ){
            return letterUnlocked;
        }
        // Nephtaline Pillar Door
        if( [user eventExists:storageQuestPillarNemedique] && ![user eventExists:storageQuestPillarNephtaline] && [user location] == 50 ){
            return letterPillar;
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        // Nemedique pillar
        if([user character]==5 || [user character] == 7){
            return @"gateNemediqueOpen";
        }
        else{
            return @"gateNemediqueClosed";
        }
    }
    
    // Condemned pillar doors
    if([user location] == 50 && [user eventExists:storageQuestPillarNephtaline] && [user character] == characterNemedique){
        [render router:[[Event alloc] initWarp:117:-1:0]];
        return @"";
    }
    
    // Warp
    if([user character] == characterNemedique || [user character] == 7){
        if([user location] == 50){
            [render router:[[Event alloc] initWarp:121:-1:0]];
            [newDraw dialog:dialogInfoPillar:eventOwl];
        }
        else if([user location] == 121){
            [render router:[[Event alloc] initWarp:50:1:0]];
        }
        else if([user location] == 9){
            [render router:[[Event alloc] initWarp:100:-1:0]];
        }
        else if([user location] == 100){
            [render router:[[Event alloc] initWarp:9:1:0]];
        }
        // Nestorine
        else if([user location] == 94){
            [render router:[[Event alloc] initWarp:92:0:-1]];
        }
        else if([user location] == 92){
            [render router:[[Event alloc] initWarp:94:1:0]];
        }
        // Nastalize
        else if([user location] ==	143){
            [render router:[[Event alloc] initWarp:146:-1:0]];
        }
        else if([user location] == 146){
            [render router:[[Event alloc] initWarp:143:1:0]];
        }
    }
    else{
        [newDraw dialog:eventDialogLocked:@"1"];
    }
    return @"";
}

-(NSString*)gateHiversaires :(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        if( [user eventExists:storageQuestPillarHiversaires]){
            return @"41";
        }
        return @"";
    }
    
    if( [user eventExists:storageQuestPillarHiversaires]){
        [render router:[[Event alloc] initWarp:148:-1:0]];
    }
    else{
        [newDraw dialog:@"123":eventOwl];
    }
    
    return @"";
}

-(NSString*)gateCatfish:(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        if([user character] == 7){
            return @"gateCatOpen";
        }
        else{
            return @"gateCatClosed";
        }
    }
    
    // Warp todo: warp to 113(random door warp is missing)
    if([user character] == 7){
        if([user location] == 130){
            [render router:[[Event alloc] initWarp:131:-1:-1]];
        }
        else if([user location] == 131){
            [render router:[[Event alloc] initWarp:130:-1:1]];
        }
        else if([user location] == 112){
            [render router:[[Event alloc] initWarp:113:0:-1]];
        }
    }
    else{
        NSString* eventDialogLocked = dialogHaveCharacterNot(letterCat);
        [newDraw dialog:eventDialogLocked:eventOwl];
    }
    
    return @"";
}

-(NSString*)gateNastazie :(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        if([user character] == 8){
            return @"gateNastazieOpen";
        }
        else{
            return @"gateNastazieClosed";
        }
    }
    
    if([user character] == 8){
        if([user location] == 130){
            [render router:[[Event alloc] initWarp:147:0:-1]];
        }
        else if([user location] == 147){
            [render router:[[Event alloc] initWarp:130:0:1]];
        }
    }
    
    [newDraw dialog:@"GLF":eventOwl];
    
    return @"";
}

-(NSString*)courtyard:(NSString*)option
{
	// Broadcast Notification |warp|11|1,0
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	if( [user isFinished] ){
		[user setLocation:116];
		[user setPosition:1:0];
		[render router:[[Event alloc] initWarp:116:1:0]];
	}
	else{
		[render router:[[Event alloc] initWarp:11:1:0]];
	}
	
	// Default
	return @"";
}-(NSString*)gateEnd:(NSString*)option
{
	// count pillars
	int count = 0;
	if([user eventExists:storageQuestPillarNecomedre]){ count += 1; }
	if([user eventExists:storageQuestPillarNemedique]){ count += 1; }
	if([user eventExists:storageQuestPillarNeomine]){ count += 1; }
	if([user eventExists:storageQuestPillarNephtaline]){ count += 1; }
	if([user eventExists:storageQuestPillarNestorine]){ count += 1; }
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		if(count == 5){
			return @"gateRedOpen";
		}
		else{
			return @"gateRedClosed";
		}
	}
	
	if( [user isFinished] && count == 5){
		[render router:[[Event alloc] initWarp:115:-1:0]];
	}
	else if(count == 5){
		[render router:[[Event alloc] initWarp:104:-1:0]];
	}
	else{
		[newDraw dialog:dialogHavePillarsNot:eventRed];
	}
	
	return @"";
}

# pragma mark NPCs -

-(NSString*)redGhost:(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		
		if( [user location] == 31 && ![user eventExists:storageGhostOffice] ){
			[newDraw sequenceRedSight];
		}
		else if( [user location] == 36 && ![user eventExists:storageGhostNecomedre] ){
			[newDraw sequenceRedSight];
		}
		else if( [user location] == 40 && ![user eventExists:storageGhostNephtaline] ){
			[newDraw sequenceRedSight];
		}
		else if( [user location] == 68 && ![user eventExists:storageGhostNeomine] ){
			[newDraw sequenceRedSight];
		}
		else if( [user location] == 86 && ![user eventExists:storageGhostNestorine] ){
			[newDraw sequenceRedSight];
		}
		else{ [newDraw sequenceRedHide]; }
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user location] == 31||[user location] == 36||[user location] == 40|[user location] == 68||[user location] == 86){
			return eventRed;
		}
		return @"0";
	}
	
	return @"";
}

-(void)sharkDialog
{
	[newDraw dialog:dialogSharkTransform:eventShark];
}

-(void)sharkTransform
{
	[user setCharacter:1];
}

-(NSString*)sauvegarde:(NSString*)option
{
	// lokiva
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[newDraw dialog:dialogHiversaires:eventHiversaires];
	
	return @"";
}

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

-(NSString*)null :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Default
	return @"";
}

# pragma mark Necomedre -

-(NSString*)photocopier1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"photocopier1";
	NSString*	eventSpriteId	= eventPhotocopier;
	int			eventSpell		= spellDocument;
	NSString* eventDialogSpell  = dialogGainSpell(letterDocument);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterDocument;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
	else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
	else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
	
	[render spellCollect:eventSpellId:6];
	
	[[[Audio alloc] init] dialog:@"photocopier"];
	
	return @"";
}

-(NSString*)photocopier2 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"photocopier2";
	NSString*	eventSpriteId	= eventPhotocopier;
	int			eventSpell		= spellDocument;
	NSString* eventDialogSpell = dialogGainSpell(letterDocument);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterDocument;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
	else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
	else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
	
	[render spellCollect:eventSpellId:6];
	[[[Audio alloc] init] dialog:@"photocopier"];
	
	return @"";
}

-(NSString*)photocopier3 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"photocopier3";
	NSString*	eventSpriteId	= eventPhotocopier;
	int			eventSpell		= spellDocument;
	NSString* eventDialogSpell = dialogGainSpell(letterDocument);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterDocument;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
	else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
	else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
	
	[render spellCollect:eventSpellId:6];
	[[[Audio alloc] init] dialog:@"photocopier"];
	
	return @"";
}

-(NSString*)necomedreNephtaline1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"necomedreNephtaline1";
	NSString*	eventSpriteId	= eventNephtaline;
	int			eventSpell		= spellNephtaline;
	NSString* eventDialogSpell = dialogGainSpell(letterNephtaline);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterNephtaline;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
	else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
	else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nephtaline"];
	
	return @"";
}

-(NSString*)necomedreNephtaline2 :(NSString*)option
{
	
	// Event Identifier
	NSString*	eventSpellId	= @"necomedreNephtaline2";
	NSString*	eventSpriteId	= eventNephtaline;
	int			eventSpell		= spellNephtaline;
	NSString* eventDialogSpell = dialogGainSpell(letterNephtaline);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterNephtaline;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
	else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
	else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nephtaline"];
	
	return @"";
}

-(NSString*)necomedreNephtaline3 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"necomedreNephtaline3";
	NSString*	eventSpriteId	= eventNephtaline;
	int			eventSpell		= spellNephtaline;
	NSString* eventDialogSpell = dialogGainSpell(letterNephtaline);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterNephtaline;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
	else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
	else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nephtaline"];
	
	return @"";
}

-(NSString*)necomedreNestorine1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"necomedreNestorine1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNestorine);
	NSString*	eventLetter			= letterNestorine;
	NSString*	eventSpriteId		= eventNestorine;
	int			eventSpell			= spellNestorine;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNecomedre);
	int			eventRequirement	= characterNecomedre;
	int eventRamenRequirement		= storageQuestRamenNecomedre;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// Must be Nephtaline
		if([user character] != eventRequirement){ return @""; }
		// Must have ramen guy
		if(![user eventExists: eventRamenRequirement]){ return @""; }
		// If doesn't have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// Have the first pillar
		if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[[[Audio alloc] init] dialog:@"nestorine"];
	// If doesn't have the first pillar
	if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	// If the wrong character
	if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	
	[render spellCollect:eventSpellId:eventSpell];
	[newDraw dialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

-(NSString*)necomedreNemedique1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"necomedreNemedique1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNemedique);
	NSString*	eventLetter			= letterNemedique;
	NSString*	eventSpriteId		= eventNemedique;
	int			eventSpell			= spellNemedique;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNephtaline);
	int			eventRequirement	= characterNephtaline;
	int eventRamenRequirement		= storageQuestRamenNephtaline;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// If the wrong character
		if([user character] != eventRequirement){ return @""; }
		// If without the ramen guy
		if(![user eventExists: eventRamenRequirement]){ return @""; }
		// If have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// If doesn't have the first pillar
		if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[[[Audio alloc] init] dialog:@"nemedique"];
	// If doesn't have the first pillar
	if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	// If the wrong character
	if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	
	[render spellCollect:eventSpellId:eventSpell];
	[newDraw dialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

-(NSString*)tutorialCharacter :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		if([user location] == 30){
			if([user character] == 6){ return letterDocument; }
			else{ return @""; }
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return eventTutorial;
	}
	
	// Dialogs
	if([user location]==30){
		if([user character] == 6){
			[newDraw dialog:dialogTutorialTalk1:eventTutorial];
			[NSTimer scheduledTimerWithTimeInterval:5 target:newDraw selector:@selector(sequenceIntro) userInfo:nil repeats:NO];
			[NSTimer scheduledTimerWithTimeInterval:4 target:newDraw selector:@selector(closeDialog) userInfo:nil repeats:NO];
			[newDraw eraseNotifications];
			[newDraw animateTransform:1];
			[user setCharacter:1];
			[user setEnabled:0];
		}
	}

	
	
	return @"";
}

-(NSString*)tutorialRedDoor :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[render router:[[Event alloc] initWarp:1:0:0]];
	[newDraw dialog:dialogTutorialTalk3:eventRed];
	
	return @"";
}

-(NSString*)intercom:(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(![newSound isPlaying]){ return @"21"; }
		else{ return @"20"; }
	}
	
	// Dialogs
	if(![newSound isPlaying]){
		[newSound start];
		[newDraw dialog:dialogAudioOn:eventAudio];
		[[[Audio alloc] init] dialog:@"speakerphone"];
	}
	else{
		[newSound start];
		[newDraw dialog:dialogAudioOff:eventAudio];
		[[[Audio alloc] init] dialog:@"speakerphone"];
	}
	
	return @"";
}

# pragma mark Nephtaline -

-(NSString*)nephtalineNeomine1 :(NSString*)option
{
    // Event Identifier
    NSString *eventSpellId = @"nephtalineNeomine1";
    NSString *eventSpriteId = @"4";
    int		  eventSpell = 3;
    NSString *eventDialogSpell = dialogGainSpell(letterNeomine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return @"E";
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])			{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else										{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"neomine"];
    
    return @"";
}
-(NSString*)nephtalineNeomine2 :(NSString*)option
{
    // Event Identifier
    NSString *eventSpellId = @"nephtalineNeomine2";
    NSString*	eventSpriteId = @"4";
    int			eventSpell = 3;
    NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return @"E";
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"neomine"];
    
    return @"";
}

-(NSString*)nephtalineNeomine3 :(NSString*)option
{
    // Event Identifier
    NSString *eventSpellId = @"nephtalineNeomine3";
    NSString*	eventSpriteId = @"4";
    int			eventSpell = 3;
    NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return @"E";
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character] )				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"neomine"];
    
    return @"";
}

-(NSString*)nephtalineNemedique1 :(NSString*)option
{
    // Special Event Identifier
    NSString*	eventSpellId		= @"nephtalineNemedique1";
    NSString*	eventDialogSpell	= dialogGainSpell(letterNemedique);
    NSString*	eventLetter			= letterNemedique;
    NSString*	eventSpriteId		= eventNemedique;
    int			eventSpell			= spellNemedique;
    
    NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNephtaline);
    int			eventRequirement	= characterNephtaline;
    int eventRamenRequirement		= storageQuestRamenNephtaline;
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        // Must be Nephtaline
        if([user character] != eventRequirement){ return @""; }
        // Must have ramen guy
        if(![user eventExists: eventRamenRequirement]){ return @""; }
        // If doesn't have spell already
        if([user spellExists:eventSpellId]){ return @""; }
        // Have the first pillar
        if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
        // Else
        return eventLetter;
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"nemedique"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [render spellCollect:eventSpellId:eventSpell];
    [newDraw dialog:eventDialogSpell:eventSpriteId];
    
    return @"";
}

-(NSString*)nephtalineNecomedre1 :(NSString*)option
{
    // Special Event Identifier
    NSString*	eventSpellId		= @"necomedreNecomedre1";
    NSString*	eventDialogSpell	= dialogGainSpell(letterNecomedre);
    NSString*	eventLetter			= letterNecomedre;
    NSString*	eventSpriteId		= eventNecomedre;
    int			eventSpell			= spellNecomedre;
    
    NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNeomine);
    int			eventRequirement	= characterNeomine;
    int eventRamenRequirement		= storageQuestRamenNeomine;
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        // Must be Nephtaline
        if([user character] != eventRequirement){ return @""; }
        // Must have ramen guy
        if(![user eventExists: eventRamenRequirement]){ return @""; }
        // If doesn't have spell already
        if([user spellExists:eventSpellId]){ return @""; }
        // Have the first pillar
        if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
        // Else
        return eventLetter;
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){	return @""; }
    
	[[[Audio alloc] init] dialog:@"necomedre"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [render spellCollect:eventSpellId:eventSpell];
    [newDraw dialog:eventDialogSpell:eventSpriteId];
    
    return @"";
}

# pragma mark Neomine -

-(NSString*)neomineNestorine1 :(NSString*)option
{
    // Event Identifier
    NSString *eventSpellId = @"neomineNestorine1";
    NSString*	eventSpriteId = @"5";
    int			eventSpell = 4;
    
    NSString* eventDialogSpell = dialogGainSpell(letterNestorine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return @"B";
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])			{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else										{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:4];
	[[[Audio alloc] init] dialog:@"nestorine"];
    
    return @"";
}

-(NSString*)neomineNestorine2 :(NSString*)option
{
    // Event Identifier
    NSString *eventSpellId = @"neomineNestorine2";
    NSString*	eventSpriteId = @"5";
    int			eventSpell = 4;
    NSString* eventDialogSpell = dialogGainSpell(letterNestorine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return @"B";
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])			{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else										{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:4];
	[[[Audio alloc] init] dialog:@"nestorine"];
    
    return @"";
}

-(NSString*)neomineNestorine3 :(NSString*)option
{
    // Event Identifier
    NSString *eventSpellId = @"neomineNestorine3";
    NSString*	eventSpriteId = @"5";
    int			eventSpell = 4;
    NSString* eventDialogSpell = dialogGainSpell(letterNestorine);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return @"B";
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])			{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else										{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nestorine"];
    
    return @"";
}

-(NSString*)neomineNecomedre1 :(NSString*)option
{
    // Special Event Identifier
    NSString*	eventSpellId		= @"neomineNecomedre1";
    NSString*	eventDialogSpell	= dialogGainSpell(letterNecomedre);
    NSString*	eventLetter			= letterNecomedre;
    NSString*	eventSpriteId		= eventNecomedre;
    int			eventSpell			= spellNecomedre;
    
    NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNeomine);
    int			eventRequirement	= characterNeomine;
    int eventRamenRequirement		= storageQuestRamenNeomine;
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        // Must be Nephtaline
        if([user character] != eventRequirement){ return @""; }
        // Must have ramen guy
        if(![user eventExists: eventRamenRequirement]){ return @""; }
        // If doesn't have spell already
        if([user spellExists:eventSpellId]){ return @""; }
        // Have the first pillar
        if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
        // Else
        return eventLetter;
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"necomedre"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [render spellCollect:eventSpellId:eventSpell];
    [newDraw dialog:eventDialogSpell:eventSpriteId];
    
    return @"";
}

-(NSString*)neomineNephtaline1 :(NSString*)option
{
    // Special Event Identifier
    NSString*	eventSpellId		= @"neomineNephtaline1";
    NSString*	eventDialogSpell	= dialogGainSpell(letterNephtaline);
    NSString*	eventLetter			= letterNephtaline;
    NSString*	eventSpriteId		= eventNephtaline;
    int			eventSpell			= spellNephtaline;
    
    NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNestorine);
    int			eventRequirement	= characterNestorine;
    int eventRamenRequirement		= storageQuestRamenNestorine;
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        // Must be Nephtaline
        if([user character] != eventRequirement){ return @""; }
        // Must have ramen guy
        if(![user eventExists: eventRamenRequirement]){ return @""; }
        // If doesn't have spell already
        if([user spellExists:eventSpellId]){ return @""; }
        // Have the first pillar
        if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
        // Else
        return eventLetter;
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"nephtaline"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [render spellCollect:eventSpellId:eventSpell];
    [newDraw dialog:eventDialogSpell:eventSpriteId];
	[[[Audio alloc] init] dialog:@"nephtaline"];
    
    return @"";
}

-(NSString*)petuniaFork:(NSString*)option
{
    if([option isEqualToString:@"postNotification"]){ return @""; }
    if([option isEqualToString:@"postUpdate"]){	return @""; }
    
    if([user isFinished]){
        [render router:[[Event alloc] initWarp:110:-1:-1]];
    }
    else{
        [render router:[[Event alloc] initWarp:61:-1:-1]];
    }
    
    return @"";
}

# pragma mark Nestorine -

-(NSString*)nestorineLobbyWarp:(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[user setPosition:1:1];
	[newDraw animateWalk];
	
	[user setPosition:0:0];
	
	[newDraw sequenceWarpTo:7];
	
	return @"";
}

-(NSString*)warpNestorine:(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @""; // try with 17 ?
    }
	
	[user setPosition:0:0];
	[newDraw animateWalk];
	
	[newDraw sequenceWarpTo:80];
    return @"";
}


-(NSString*)nestorineNemedique1 :(NSString*)option
{
    // Event Identifier
    NSString*	eventSpellId	= @"nestorineNemedique1";
    NSString*	eventSpriteId	= eventNemedique;
    int			eventSpell		= spellNemedique;
    NSString* eventDialogSpell = dialogGainSpell(letterNemedique);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return letterNemedique;
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nemedique"];
    
    return @"";
}

-(NSString*)nestorineNemedique2 :(NSString*)option
{
    // Event Identifier
    NSString*	eventSpellId	= @"nestorineNemedique2";
    NSString*	eventSpriteId	= eventNemedique;
    int			eventSpell		= spellNemedique;
    NSString* eventDialogSpell = dialogGainSpell(letterNemedique);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return letterNemedique;
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nemedique"];
    
    return @"";
}

-(NSString*)nestorineNemedique3 :(NSString*)option
{
    // Event Identifier
    NSString*	eventSpellId	= @"nestorineNemedique3";
    NSString*	eventSpriteId	= eventNemedique;
    int			eventSpell		= spellNemedique;
    NSString* eventDialogSpell = dialogGainSpell(letterNemedique);
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return letterNemedique;
        }
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"nemedique"];
    
    return @"";
}

-(NSString*)nestorineNephtaline1 :(NSString*)option
{
    // Special Event Identifier
    NSString*	eventSpellId		= @"nestorineNephtaline1";
    NSString*	eventDialogSpell	= dialogGainSpell(letterNephtaline);
    NSString*	eventLetter			= letterNephtaline;
    NSString*	eventSpriteId		= eventNephtaline;
    int			eventSpell			= spellNephtaline;
    
    NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNestorine);
    int			eventRequirement	= characterNestorine;
    int eventRamenRequirement		= storageQuestRamenNestorine;
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        // Must be Nephtaline
        if([user character] != eventRequirement){ return @""; }
        // Must have ramen guy
        if(![user eventExists: eventRamenRequirement]){ return @""; }
        // If doesn't have spell already
        if([user spellExists:eventSpellId]){ return @""; }
        // Have the first pillar
        if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
        // Else
        return eventLetter;
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){	return @""; }
    
	[[[Audio alloc] init] dialog:@"nephtaline"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [render spellCollect:eventSpellId:eventSpell];
    [newDraw dialog:eventDialogSpell:eventSpriteId];
	[[[Audio alloc] init] dialog:@"nephtaline"];
    
    return @"";
}

# pragma mark Nastazie -

-(NSString*)nastazieNastazie1 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNastazie1";
    NSString * eventCharacter	= @"nastazie";
    NSString * eventSpriteId	= eventNastazie;
    int		   eventSpell		= spellNastazie;
    NSString * eventLetter		= letterNastazie;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"noface"];
    
    return @"";
}

-(NSString*)nastazieNastazie2 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNastazie2";
    NSString * eventCharacter	= @"nastazie";
    NSString * eventSpriteId	= eventNastazie;
    int		   eventSpell		= spellNastazie;
    NSString * eventLetter		= letterNastazie;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"noface"];
    
    return @"";
}

-(NSString*)nastazieNastazie3 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNastazie3";
    NSString * eventCharacter	= @"nastazie";
    NSString * eventSpriteId	= eventNastazie;
    int		   eventSpell		= spellNastazie;
    NSString * eventLetter		= letterNastazie;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:@"noface"];
    
    return @"";
}

-(NSString*)nastazieNemedique1 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNemedique1";
    NSString * eventCharacter	= @"nemedique";
    NSString * eventSpriteId	= eventNemedique;
    int		   eventSpell		= spellNemedique;
    NSString * eventLetter		= letterNemedique;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

-(NSString*)nastazieNemedique2 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNemedique2";
    NSString * eventCharacter	= @"nemedique";
    NSString * eventSpriteId	= eventNemedique;
    int		   eventSpell		= spellNemedique;
    NSString * eventLetter		= letterNemedique;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

-(NSString*)nastazieNemedique3 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNemedique3";
    NSString * eventCharacter	= @"nemedique";
    NSString * eventSpriteId	= eventNemedique;
    int		   eventSpell		= spellNemedique;
    NSString * eventLetter		= letterNemedique;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

-(NSString*)nastazieNeomine1 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNeomine1";
    NSString * eventCharacter	= @"neomine";
    NSString * eventSpriteId	= eventNeomine;
    int		   eventSpell		= spellNeomine;
    NSString * eventLetter		= letterNeomine;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}
-(NSString*)nastazieNeomine2 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNeomine2";
    NSString * eventCharacter	= @"neomine";
    NSString * eventSpriteId	= eventNeomine;
    int		   eventSpell		= spellNeomine;
    NSString * eventLetter		= letterNeomine;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}
-(NSString*)nastazieNeomine3 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNeomine3";
    NSString * eventCharacter	= @"neomine";
    NSString * eventSpriteId	= eventNeomine;
    int		   eventSpell		= spellNeomine;
    NSString * eventLetter		= letterNeomine;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

-(NSString*)nastazieNephtaline1 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNephtaline1";
    NSString * eventCharacter	= @"nephtaline";
    NSString * eventSpriteId	= eventNephtaline;
    int		   eventSpell		= spellNephtaline;
    NSString * eventLetter		= letterNephtaline;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

-(NSString*)nastazieNephtaline2 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNephtaline2";
    NSString * eventCharacter	= @"nephtaline";
    NSString * eventSpriteId	= eventNephtaline;
    int		   eventSpell		= spellNephtaline;
    NSString * eventLetter		= letterNephtaline;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

-(NSString*)nastazieNephtaline3 :(NSString*)option
{
    // Event Identifier
    NSString * eventSpellId		= @"nastazieNephtaline3";
    NSString * eventCharacter	= @"nephtaline";
    NSString * eventSpriteId	= eventNephtaline;
    int		   eventSpell		= spellNephtaline;
    NSString * eventLetter		= letterNephtaline;
    
    NSString * eventDialogSpell = dialogGainSpell(eventLetter);
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
            return eventLetter;
        }
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    // Dialogs
    if( eventSpell == [user character])				{ [newDraw dialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [newDraw dialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [newDraw dialog:eventDialogSpell:eventSpriteId]; }
    // Spell
    [render spellCollect:eventSpellId:eventSpell];
	[[[Audio alloc] init] dialog:eventCharacter];
    
    return @"";
}

#pragma mark Nemedique -

-(NSString*)nemediqueNestorine1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"nemediqueNestorine1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNestorine);
	NSString*	eventLetter			= letterNestorine;
	NSString*	eventSpriteId		= eventNestorine;
	int			eventSpell			= spellNestorine;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNecomedre);
	int			eventRequirement	= characterNecomedre;
	int eventRamenRequirement		= storageQuestRamenNecomedre;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// Must be Nephtaline
		if([user character] != eventRequirement){ return @""; }
		// Must have ramen guy
		if([user eventExists:eventRamenRequirement] < 1){ return @""; }
		// If doesn't have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// Have the first pillar
		if(![user eventExists:storageQuestPillarNemedique]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"nestorine"];
	// If doesn't have the first pillar
	if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	// If the wrong character
	if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	
	[render spellCollect:eventSpellId:eventSpell];
	[newDraw dialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

// =======================
// @ Events: NPCs
// =======================

# pragma mark NPCs -

// End Tree
-(NSString*)endReset :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"]){ return @"";}
	
	[newDraw sequenceResetTree];
	[[[Audio alloc] init] effect:@"bump1"];
	
	return @"";
}

// Red Character

-(NSString*)redEnd :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	if([option isEqualToString:@"postUpdate"]){
		if( [user eventExists:storageEndForm] == 0){
			return eventRed;
		}
		else{
			return eventNepturne;
		}
	}
	
	[newDraw sequenceEndRed];
	
	return @"";
}


-(NSString*)credit1 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @"";}
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	
	[newDraw dialog:@"OQS":@"31"];
	[[[Audio alloc] init] dialog:@"rekka"];
	[newDraw sequenceWarpTo:108];
	
	return @"";
}

-(NSString*)credit2 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @"";}
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	
	[newDraw dialog:@"OPS":@"32"];
	[[[Audio alloc] init] dialog:@"devine"];
	[newDraw sequenceWarpTo:109];
	return @"";
}

-(NSString*)credit3 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @"";}
	if([option isEqualToString:@"postUpdate"])		{ return @"";}

	[newDraw sequenceCredits3];
	return @"";
}

# pragma mark Secret -

-(NSString*)secretCat1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([user character] == characterCat){ return @""; }
		// If doesn't have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"cat"];
	
	[render spellCollect:eventSpellId:eventSpell];
	[newDraw dialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}


-(NSString*)secretCat2 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat2";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([user character] == characterCat){ return @""; }
		// If doesn't have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"cat"];
	
	[render spellCollect:eventSpellId:eventSpell];
	[newDraw dialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

-(NSString*)secretCat3 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat3";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([user character] == characterCat){ return @""; }
		// If doesn't have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[[[Audio alloc] init] dialog:@"cat"];
	
	[render spellCollect:eventSpellId:eventSpell];
	[newDraw dialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

-(NSString*)petunia:(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[newDraw roomShuffle];
	[[[Audio alloc] init] dialog:@"petinia"];
	
	return @"";
}

- (NSString*)randomObject:(NSArray*)array
{
	if ([array count] == 0) {
		return nil;
	}
	return [array objectAtIndex: arc4random() % [array count]];
}

-(NSString*)cat:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	[newDraw dialog:@"UUU":eventCat];
	[[[Audio alloc] init] dialog:@"cat"];
	
	return @"";
}

-(NSString*)catDoorFork:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	if([user isFinished]){
		[render router:[[Event alloc] initWarp:112:1:1]];
	}
	else{
		[render router:[[Event alloc] initWarp:42:1:1]];
	}
	
	return @"";
}

-(NSString*)noface:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if( [user isFinished] == 1 ){
			return eventNoFace;
		}
		return @"0";
	}
	
	if( [user isFinished] == 1 ){
		
		[user setEnabled:0];
		
		if( [user character] != 1 ){
			[self nofaceTransform];
			[NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(nofaceWarp) userInfo:nil repeats:NO];
		}
		else{
			[self nofaceWarp];
		}
		
		[[[Audio alloc] init] dialog:@"noface"];
		[newDraw dialog:dialogIntroduction:eventNoFace];
		
		// Clear Spellbook
		[user clearSpellbook];
	}
	return @"";
}
-(void)nofaceTransform
{
	[newDraw animateTransform:1];
	[user setCharacter:1];
}

-(void)nofaceWarp
{
	[newDraw sequenceWarpTo:130];
}

-(NSString*)daniel:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[newDraw dialog:@"UVW":@"34"];
	[[[Audio alloc] init] dialog:@"noface"];
	
	return @"";
}

-(NSString*)shuffleRoom:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		[self shuffler];
		return @"";
	}
	
	return @"";
}

-(NSString*)kamera:(NSString*)option
{
	return @"";
	
	/* TODO
	if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
	{
		return @"";
	}
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	NSString* twitterText = @"";
	
	// Booth #1
	if([user location] == 149){ twitterText = @"I have found the first of seven hidden photobooths in #oquonie.\n"; }
	// Booth #2
	if([user location] == 150){ twitterText = @"I have found the second of seven hidden photobooths in #oquonie.\n"; }
	// Booth #3
	if([user location] == 151){ twitterText = @"I have found the third of seven hidden photobooths in #oquonie.\n"; }
	// Booth #4
	if([user location] == 152){ twitterText = @"I have found the fourth of seven hidden photobooths in #oquonie.\n"; }
	// Booth #5
	if([user location] == 153){ twitterText = @"I have found the fifth of seven hidden photobooths in #oquonie.\n"; }
	// Booth #6
	if([user location] == 154){ twitterText = @"I have found the sixth of seven hidden photobooths in #oquonie.\n"; }
	// Booth #7
	if([user location] == 155){ twitterText = @"I have found the last of seven hidden photobooths in #oquonie!\n"; }
	
	// Take Screenshot
	CGRect rect = [self.view bounds];
	UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[self.view.layer renderInContext:context];
	UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/capturedImage.jpg"]];
	[UIImageJPEGRepresentation(capturedImage, 0.95) writeToFile:imagePath atomically:YES];
	
	SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
	[tweetSheet setInitialText:twitterText];
	[tweetSheet addImage:capturedImage];
	[self presentViewController:tweetSheet animated:YES completion:nil];
	
	return @"";
	 */
}

-(NSString*)gatePhotoBooth :(NSString*)option
{
	return @"";
	
	/* TODO
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Booth #1
		if([user location] == 3){ return @"104"; }
		// Booth #2
		if([user location] == 37){ return @"105"; }
		// Booth #3
		if([user location] == 46){ return @"106"; }
		// Booth #4
		if([user location] == 66){ return @"107"; }
		// Booth #5
		if([user location] == 89){ return @"110"; }
		// Booth #6
		if([user location] == 102){ return @"108"; }
		// Booth #7
		if([user location] == 142){ return @"109"; }
	}
	
	if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
	{
		return @"";
	}
	
	// Booth #1
	if([user location] == 3){ [self eventWarp:@"149" :@"0,-1"]; }
	// Booth #2
	if([user location] == 37){ [self eventWarp:@"150" :@"-1,-1"]; }
	// Booth #3
	if([user location] == 46){ [self eventWarp:@"151" :@"-1,0"]; }
	// Booth #4
	if([user location] == 66){ [self eventWarp:@"152" :@"-1,0"]; }
	// Booth #5
	if([user location] == 89){ [self eventWarp:@"153" :@"0,-1"]; }
	// Booth #6
	if([user location] == 102){ [self eventWarp:@"154" :@"0,-1"]; }
	// Booth #7
	if([user location] == 142){ [self eventWarp:@"155" :@"0,-1"]; }
	
	return @"";
	*/
}

-(void)shuffler
{
	[newDraw roomShuffle2];
}


@end
