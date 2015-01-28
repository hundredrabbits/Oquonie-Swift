//
//  AdvancedView.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "AdvancedView.h"

@implementation AdvancedView

- (void)drawRect:(NSRect)dirtyRect
{
    NSLog(@"!!");
    
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

@end
