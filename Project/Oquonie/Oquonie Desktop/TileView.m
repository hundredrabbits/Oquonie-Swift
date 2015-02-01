//
//  TileView.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-31.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "TileView.h"

@implementation TileView

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor blueColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

@end
