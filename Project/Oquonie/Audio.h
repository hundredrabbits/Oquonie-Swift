//
//  audio.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;

@interface Audio : NSObject

-(void)play :(NSString*)name;
-(int)isPlaying;
-(void)start;
-(void)stop;

-(void)dialog:(NSString*)filename;
-(void)effect:(NSString*)filename;
-(void)ambient:(NSString*)filename;

@end

int volume;