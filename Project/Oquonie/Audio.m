//
//  audio.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Audio.h"
#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

@implementation Audio

-(Audio*)init
{
	NSLog(@"+ AUDIO | Init");
    return self;
}

-(void)play :(NSString*)filename
{
    NSLog(@"~ AUDIO | File: %@",filename);
}

-(void)start
{
	NSLog(@"+ AUDIO | Play");
	audioAmbientPlayer.volume = 1;
	volume = 1;
}

-(void)stop
{
	NSLog(@"+ AUDIO | Stop(Mute)");
	audioAmbientPlayer.volume = 0;
	volume = 0;
}

-(int)isPlaying
{
    return volume;
}

# pragma mark Audio Stuff -

-(void)ambient:(NSString*)name
{
	
	NSLog(@"~ AUDIO | Ambient: %@",name);
	
	if( [name isEqualToString:@"town1"] && [user isFinished] == 1 ){ name = @"town3"; }
	if( [name isEqualToString:@"town1"] && [user eventExists:storageQuestPillarNemedique] == 1 ){ name = @"town2"; }
	
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:name ofType:@"mp3"]];
	audioAmbientPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	[audioAmbientPlayer prepareToPlay];
	audioAmbientPlayer.numberOfLoops = -1;
	[audioAmbientPlayer play];
}

-(void)dialog:(NSString*)name
{
	NSLog(@"~ AUDIO | Dialog: %@",name);
	
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"dialog_%@",name] ofType:@"wav"]];
	audioDialogPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	[audioEffectPlayer prepareToPlay];
	[audioDialogPlayer play];
}

-(void)effect:(NSString*)name
{
	NSLog(@"~ AUDIO | Effect: %@",name);
	
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"sfx_%@",name] ofType:@"wav"]];
	audioDialogPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	[audioEffectPlayer prepareToPlay];
	[audioDialogPlayer play];
}


@end
