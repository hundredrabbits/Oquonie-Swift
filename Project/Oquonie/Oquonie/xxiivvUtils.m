//
//  xxiivvViewController+xxiivvUtils.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

/*
# Event IDs
== + =========== + ================== + ============================
id | Location    | Event Name         | Notes
== + =========== + ================== + ============================
1  | Settings    | audioToggle        | 1 = on
2  | Settings    |
3  | Settings    |
4  | Settings    |
5  | Settings    |
6  | Settings    |
7  | Settings    |
8  | Settings    |
9  | Settings    |
== + =========== + ================== + ============================
10 | Necomedre   | photocopier1       |
11 | Necomedre   | photocopier2       |
12 | Necomedre   | photocopier3       |
12 | Necomedre   | photocopierDoor    | Remember not to display message every time you enter the room
 
 # Alphabet
== + =========== + ================== + ============================
 N | Audio
 X | Document
*/


#import "xxiivvUtils.h"

@implementation xxiivvViewController (xxiivvUtils)

-(BOOL)util_IsSpell :(int)storageId
{
	if(storageId == 10){ return TRUE;}
	if(storageId == 11){ return TRUE;}
	if(storageId == 12){ return TRUE;}
	return FALSE;
}

-(NSString*)util_CharIdToLetter :(int)charId
{
	if(charId == 6){ return @"X"; }
	return @"A";
}


-(NSString*)util_StorageIdToLetter :(int)storageId
{
	if(storageId == 1 ){ return @"N"; }
	if(storageId == 10){ return @"X"; }
	if(storageId == 11){ return @"X"; }
	if(storageId == 12){ return @"X"; }
	return @"";
}



@end
