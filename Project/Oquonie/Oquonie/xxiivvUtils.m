//
//  xxiivvViewController+xxiivvUtils.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//


#import "xxiivvUtils.h"

@implementation xxiivvViewController (xxiivvUtils)

-(NSString*)util_CharIdToLetter :(int)charId
{
	if(charId == 1){ return @"D"; }
	if(charId == 2){ return @"C"; }
	if(charId == 3){ return @"E"; }
	if(charId == 4){ return @"B"; }
	if(charId == 5){ return @"A"; }
	if(charId == 6){ return @"X"; }
	if(charId == 7){ return @"5"; }
	if(charId == 8){ return @"F"; }
	return @"";
}

@end
