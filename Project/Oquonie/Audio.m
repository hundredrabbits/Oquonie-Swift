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
}

-(void)stop
{
	
}

-(int)isPlaying
{
    return 1;
}

# pragma mark Audio Stuff -

-(void)decreaseVolume:(NSString*)filename {
	// Until threshold is met, lower volume and repeat
	if(audioAmbientPlayer.volume > 0.1) {
		audioAmbientPlayer.volume = audioAmbientPlayer.volume - 0.05;
		[self performSelector:@selector(decreaseVolume) withObject:nil afterDelay:0.1];
	}
	// Stop and reset audio
	else {
		[audioAmbientPlayer stop];
		audioAmbientPlayer.currentTime = 0;
		[audioAmbientPlayer prepareToPlay];
		
		audioCurrentlyPlaying = filename;
		[self audioAmbientPlayer:filename];
		NSLog(@"ready to play");
	}
	
	NSLog(@"%f",audioAmbientPlayer.volume);
}


-(void)audioAmbientPlayer:(NSString*)filename
{
	if([user isListening] == 0){
		return;
	}
	
	if(audioCurrentlyPlaying != filename){
		[self fadeOut];
		audioCurrentlyPlaying = filename;
	}
	else{
		[self fadeIn];
	}
}

-(void)fadeOut
{
	if(audioAmbientPlayer.volume > 0.1) {
		audioAmbientPlayer.volume = audioAmbientPlayer.volume - 0.2;
		[self performSelector:@selector(fadeOut) withObject:nil afterDelay:0.1];
	}
	else {
		[self audioAmbientPlayer:audioCurrentlyPlaying];
	}
	NSLog(@"fade out: %f",audioAmbientPlayer.volume);
}

-(void)fadeIn
{
	// Initiate audio player if volume is low
	if(audioAmbientPlayer.volume < 0.1){
		[self playAudio:audioCurrentlyPlaying];
	}
	
	// Until threshold is met, lower volume and repeat
	if(audioAmbientPlayer.volume < 1) {
		audioAmbientPlayer.volume += 0.3;
		[self performSelector:@selector(fadeIn) withObject:nil afterDelay:0.1];
	}
	//	if(self.audioAmbientPlayer.volume > 1){ self.audioAmbientPlayer.volume = 1;}
	NSLog(@"fade in: %f",audioAmbientPlayer.volume);
}

-(void)playAudio:(NSString*)filename
{
	if([filename isEqualToString:@"town1.mp3"] && [user isFinished] == 1){
		filename = @"town3.mp3";
	}
	else if([filename isEqualToString:@"town1.mp3"] && [user eventExists:storageQuestPillarNemedique] == 1){
		filename = @"town2.mp3";
	}
	
	float currentVolume = audioAmbientPlayer.volume;
	NSError *error;
	NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString: [NSString stringWithFormat:@"/%@", filename] ];
	
	audioAmbientPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&error];
	
	if (error){
		NSLog(@"$ ERROR | Ambient      | Error    -> (%@)%@",filename,[error localizedDescription]);
	}
	else {
		NSLog(@"$ AUDIO | Ambient      | File     -> %@",filename);
		audioAmbientPlayer.numberOfLoops = -1;
		[audioAmbientPlayer prepareToPlay];
		audioAmbientPlayer.volume = currentVolume;
	}
	
	if(debug != 1){
		[audioAmbientPlayer play];
	}
}

-(void)audioEffectPlayer:(NSString*)filename
{
	audioEffectPlayer.volume = 0.5;
	filename = [NSString stringWithFormat:@"sfx_%@.wav",filename];
	NSError *error;
	NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString: [NSString stringWithFormat:@"/%@", filename] ];
	audioEffectPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&error];
	if (error){
		NSLog(@"$ ERROR | Effect       | Error    -> (%@)%@",filename,[error localizedDescription]);
	}
	else {
		NSLog(@"$ AUDIO | Effect       | File     -> %@",filename);
		audioEffectPlayer.numberOfLoops = 0;
		audioEffectPlayer.currentTime = 0;
		[audioEffectPlayer prepareToPlay];
		audioEffectPlayer.volume = 0.5;
	}
	[audioEffectPlayer play];
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
