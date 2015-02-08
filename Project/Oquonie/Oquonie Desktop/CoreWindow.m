//
//  CoreWindow.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvVariables.h"
#import "CoreWindow.h"

@implementation CoreWindow

-(void)fullscreen
{
	NSLog(@"! WNDOW | Fullscreen");
	[self toggleFullScreen:@""];
}

- (void)keyDown:(NSEvent *)theEvent
{
	if( [theEvent keyCode] == 53 ){
		NSLog(@"escape");
		[self toggleFullScreen:@""];
	}
	
    if ([theEvent modifierFlags] & NSNumericPadKeyMask) { // arrow keys have this mask
        NSString *theArrow = [theEvent charactersIgnoringModifiers];
		unichar keyChar = 0;
		if ( [user enabled] == 0 )
			return;            // Cannot move yet
        if ( [theArrow length] == 0 )
            return;            // reject dead keys
        if ( [theArrow length] == 1 ) {
            keyChar = [theArrow characterAtIndex:0];
            Input * newInput = [[Input alloc] init];
            if ( keyChar == NSLeftArrowFunctionKey ) {
                NSLog(@"#   KEY | Left");
                [user setHorizontal:@"l"];
                [user setVertical:@"b"];
                [newInput router:1:0];
                return;
            }
            if ( keyChar == NSRightArrowFunctionKey ) {
                NSLog(@"#   KEY | Right");
                [user setHorizontal:@"r"];
                [user setVertical:@"f"];
                [newInput router:-1:0];
                return;
            }
            if ( keyChar == NSUpArrowFunctionKey ) {
                NSLog(@"#   KEY | Up");
                [user setHorizontal:@"r"];
                [user setVertical:@"b"];
                [newInput router:0:1];
                return;
            }
            if ( keyChar == NSDownArrowFunctionKey ) {
                NSLog(@"#   KEY | Down");
                [user setHorizontal:@"l"];
                [user setVertical:@"f"];
                [newInput router:0:-1];
                return;
            }
			if( keyChar == 53 ){
				NSLog(@"escape!");
			}
            [super keyDown:theEvent];
        }
    }
    [super keyDown:theEvent];
}

@end
