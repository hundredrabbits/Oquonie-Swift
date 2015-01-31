//
//  DrawView.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-31.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

-(DrawView*)init
{
    view = self;
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

- (void)drawRect2:(NSRect)dirtyRect
{
    // add a background image
    NSColor *backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:@"Background"]];
    [backgroundColor setFill];
    NSRectFill(dirtyRect);
    
    [super drawRect:dirtyRect];
}

@end
