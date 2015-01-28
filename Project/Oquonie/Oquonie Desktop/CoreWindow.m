//
//  CoreWindow.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "CoreWindow.h"

@implementation CoreWindow

- (void)keyDown:(NSEvent *)theEvent {
    
    if ([theEvent modifierFlags] & NSNumericPadKeyMask) { // arrow keys have this mask
        NSString *theArrow = [theEvent charactersIgnoringModifiers];
        unichar keyChar = 0;
        if ( [theArrow length] == 0 )
            return;            // reject dead keys
        if ( [theArrow length] == 1 ) {
            keyChar = [theArrow characterAtIndex:0];
            if ( keyChar == NSLeftArrowFunctionKey ) {
                NSLog(@"Left");
                return;
            }
            if ( keyChar == NSRightArrowFunctionKey ) {
                NSLog(@"Right");
                return;
            }
            if ( keyChar == NSUpArrowFunctionKey ) {
                NSLog(@"Up");
                return;
            }
            if ( keyChar == NSDownArrowFunctionKey ) {
                NSLog(@"Down");
                return;
            }
            [super keyDown:theEvent];
        }
    }
    [super keyDown:theEvent];
}

@end
