//
//  Draw.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface Render : NSObject

-(void)add :(Event*)event;

@end

NSMutableArray* queue;