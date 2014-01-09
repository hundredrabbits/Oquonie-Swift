//
//  xxiivvViewController+xxiivvUtils.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

@interface xxiivvViewController (xxiivvUtils)

-(BOOL)util_IsSpell :(int)storageId;
-(NSString*)util_CharIdToLetter :(int)charId;
-(NSString*)util_StorageIdToLetter :(int)storageId;

@end
