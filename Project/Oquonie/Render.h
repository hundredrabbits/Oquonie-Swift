//
//  Draw.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import "Draw.ios.h"
#else
#import "Draw.osx.h"
#endif

#import "Event.h"

@interface Render : NSObject

-(void)router :(Event*)event;
-(void)spellCollect :(NSString*)spellId :(int)spellType;

@end

Draw* newDraw;