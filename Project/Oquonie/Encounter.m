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
    NSLog(@"* ENCNT | Init");
    newDraw = [[Draw alloc] init];
    newSound = [[Audio alloc] init];
    return self;
}

-(Encounter*)initWithName :(NSString*)name
{
    encounterName = name;
    return self;
}

-(void)touch
{
    NSLog(@"- ENCNT + Touch        + %@", encounterName);
    SEL targetSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:",encounterName]);
    [self performSelector:targetSelector withObject:@"touch"];
}

-(void)see
{
    NSLog(@"- ENCNT + See          + %@", encounterName);
    SEL targetSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:",encounterName]);
    [self performSelector:targetSelector withObject:@"see"];
}

# pragma mark Lobby -

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
    
    // Default
    return @"";
}

-(NSString*)owlSave :(NSString*)option
{
    if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
    if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
    
    // Dialog
    [newDraw dialog:dialogOwlSave:eventOwl];
    [newSound play:@"owl"];
    [user save];
    
    // Return storage Id
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
    [user spellCollect:eventSpellId:eventSpell];
    [newSound play:@"neomine"];
    
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
    [user spellCollect:eventSpellId:eventSpell];
    [newSound play:@"neomine"];
    
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
    [user spellCollect:eventSpellId:eventSpell];
    [newSound play:@"neomine"];
    
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
    
    [newSound play:@"nemedique"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [user spellCollect:eventSpellId:eventSpell];
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
    
    [newSound play:@"necomedre"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [user spellCollect:eventSpellId:eventSpell];
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
    [user spellCollect:eventSpellId:4];
    [newSound play:@"nestorine"];
    
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
    [user spellCollect:eventSpellId:4];
    [newSound play:@"nestorine"];
    
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
    [user spellCollect:eventSpellId:eventSpell];
    [newSound play:@"nestorine"];
    
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
    
    [newSound play:@"necomedre"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [user spellCollect:eventSpellId:eventSpell];
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
    
    [newSound play:@"nephtaline"];
    // If doesn't have the first pillar
    if(![user eventExists: storageQuestPillarNemedique]){ [newDraw dialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
    // If the wrong character
    if([user character] != eventRequirement){ [newDraw dialog:eventWrongCharacter:eventSpriteId]; return @""; }
    // If without the ramen guy
    if(![user eventExists: eventRamenRequirement]){ [newDraw dialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
    
    [user spellCollect:eventSpellId:eventSpell];
    [newDraw dialog:eventDialogSpell:eventSpriteId];
    
    return @"";
}

-(NSString*)petuniaFork:(NSString*)option
{
    if([option isEqualToString:@"postNotification"]){ return @""; }
    if([option isEqualToString:@"postUpdate"]){	return @""; }
    
    if([user isFinished]){
        Event * newEvent = [[Event alloc] initWarp:110:-1:-1];
        [render router:newEvent];
    }
    else{
        Event * newEvent = [[Event alloc] initWarp:61:-1:-1];
        [render router:newEvent];
    }
    
    return @"";
}


@end
