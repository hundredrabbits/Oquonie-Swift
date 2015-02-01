//
//  Position.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Position : NSObject

- (Position*)initWithView :(CGRect)viewFrame;
- (CGRect)tile :(int)type :(int)posX :(int)posY;
- (CGFloat)tileH;
- (CGFloat)tileW;

@end

CGRect screenFrame;