//
//  Position.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Position.h"

@implementation Position

-(Position*)initWithView :(CGRect)viewFrame
{
    NSLog(@"+ FRAME | Init");
    screenFrame = viewFrame;
    return self;
}

-(CGFloat)tileW
{
    CGFloat screenMargin = screenFrame.size.width/8;
    CGFloat viewWidth = screenFrame.size.width - (2*screenMargin);
    return viewWidth/3;
}
-(CGFloat)tileH
{
    CGFloat screenMargin = screenFrame.size.width/8;
    CGFloat viewWidth = screenFrame.size.width - (2*screenMargin);
    CGFloat tileW = viewWidth/3;
    return tileW * 0.5;
}

- (CGRect)tile :(int)type :(int)posX :(int)posY
{
    CGFloat screenMargin = screenFrame.size.width/8;
    CGFloat viewWidth = screenFrame.size.width - (2*screenMargin);
    CGFloat tileW = viewWidth/3;
    CGFloat tileH = tileW * 0.5;
    
    CGFloat centerW = (screenFrame.size.width/2)-(tileW/2);
    CGFloat centerH = (screenFrame.size.height/2)-(tileH/2)*2;
    
    // Wall
    if( type == 5 ){
        tileH = tileH * 2;
    }
    
    if( type == 4 ){
        tileH = tileH * 2;
        CGFloat centerH = (screenFrame.size.height/2)-(tileH/2)*2.5;
        if( posX == 0 && posY == 0 ){ return CGRectMake(centerW, centerH + tileH - (tileH*0.15), tileW, tileH); }
        if( posX == -1 && posY == -1 ){ return CGRectMake(centerW, centerH + tileH - (tileH*0.5), tileW, tileH); }
        if( posX ==  1 && posY ==  1 ){ return CGRectMake(centerW, centerH + tileH + (tileH*0.19), tileW, tileH); }
        if( posX ==  -1 && posY ==  0 ){ return CGRectMake(centerW + (tileW*0.35), centerH + tileH - (tileH*0.35), tileW, tileH); }
        if( posX ==  0 && posY == -1 ){ return CGRectMake(centerW - (tileW*0.35), centerH + tileH - (tileH*0.35), tileW, tileH); }
        
        if( posX ==  1 && posY == 0 ){ return CGRectMake(centerW - (tileW*0.35), centerH + tileH + (tileH*0.03), tileW, tileH); }
        if( posX ==  0 && posY == 1 ){ return CGRectMake(centerW + (tileW*0.35), centerH + tileH + (tileH*0.03), tileW, tileH); }
        
        if( posX ==  1 && posY == -1 ){ return CGRectMake(centerW - (tileW*0.75), centerH + tileH - (tileH*0.15), tileW, tileH); }
        if( posX ==  -1 && posY == 1 ){ return CGRectMake(centerW + (tileW*0.7), centerH + tileH - (tileH*0.15), tileW, tileH); }
    }
    
    // Tiles
    
#if TARGET_OS_IPHONE
    
    if( posX == 0 && posY == 0 ){ return CGRectMake(centerW, centerH, tileW, tileH); }
    if( posX == 1 && posY ==-1 ){ return CGRectMake(centerW-tileW, centerH, tileW, tileH); }
    if( posX ==-1 && posY == 1 ){ return CGRectMake(centerW+tileW, centerH, tileW, tileH); }
    if( posX == 1 && posY == 0 ){ return CGRectMake(centerW-(tileW/2), centerH-(tileH/2), tileW, tileH); }
    if( posX == 0 && posY == 1 ){ return CGRectMake(centerW+(tileW/2), centerH-(tileH/2), tileW, tileH); }
    if( posX == 0 && posY ==-1 ){ return CGRectMake(centerW-(tileW/2), centerH+(tileH/2), tileW, tileH); }
    if( posX ==-1 && posY == 0 ){ return CGRectMake(centerW+(tileW/2), centerH+(tileH/2), tileW, tileH); }
    if( posX ==-1 && posY ==-1 ){ return CGRectMake(centerW, centerH+tileH, tileW, tileH);}
    if( posX == 1 && posY == 1 ){ return CGRectMake(centerW, centerH-tileH, tileW, tileH); }
    
    if( posX == 1 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*3, centerH+(tileH*0.5), tileW, tileH); }
    if( posX == 0 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*2, centerH+tileH, tileW, tileH); }
    if( posX ==-1 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*1, centerH+(tileH*1.5), tileW, tileH); }
    
    if( posX ==-2 && posY == 1 ){ return CGRectMake(centerW+(tileW/2)*3, centerH+(tileH*0.5), tileW, tileH); }
    if( posX ==-2 && posY == 0 ){ return CGRectMake(centerW+(tileW/2)*2, centerH+(tileH*1.0), tileW, tileH); }
    if( posX ==-2 && posY ==-1 ){ return CGRectMake(centerW+(tileW/2), centerH+(tileH*1.5), tileW, tileH); }
    
#else
    
    if( posX == 0 && posY == -1 ){ return CGRectMake(centerW-(tileW/2) + (tileW/7), centerH-(tileH/2) + (tileH/7), tileW, tileH); }
    if( posX == 1 && posY ==  0 ){ return CGRectMake(centerW-(tileW/2) + (tileW/7), centerH+(tileH/2) - (tileH/7), tileW, tileH); }
    if( posX == -1 && posY == 0 ){ return CGRectMake(centerW+(tileW/2) - (tileW/7), centerH-(tileH/2) + (tileH/7), tileW, tileH); }
    if( posX ==  0 && posY == 1 ){ return CGRectMake(centerW+(tileW/2) - (tileW/7), centerH+(tileH/2) - (tileH/7), tileW, tileH); }
    if( posX == 1 && posY == 1 ){ return CGRectMake(centerW, centerH+tileH - (tileH/3.5), tileW, tileH);}
    if( posX ==-1 && posY ==-1 ){ return CGRectMake(centerW, centerH-tileH + (tileH/3.5), tileW, tileH); }
    if( posX == 0 && posY == 0 ){ return CGRectMake(centerW, centerH, tileW, tileH); }
    if( posX == 1 && posY ==-1 ){ return CGRectMake(centerW-tileW + (tileW/3.5), centerH, tileW, tileH); }
    if( posX ==-1 && posY == 1 ){ return CGRectMake(centerW+tileW - (tileW/3.5), centerH, tileW, tileH); }
    
    if( posX == 1 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*3 + (tileW/7)*3, centerH-(tileH*0.5) + (tileH/7)*1, tileW, tileH); }
    if( posX == 0 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*2 + (tileW/7)*2, centerH-tileH + (tileH/7)*2, tileW, tileH); }
    if( posX ==-1 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*1 + (tileW/7), centerH-(tileH*1.5) + (tileH/7)*3, tileW, tileH); }
    
    if( posX ==-2 && posY == 1 ){ return CGRectMake(centerW+(tileW/2)*3 - (tileW/7)*3, centerH-(tileH*0.5) + (tileH/7)*1, tileW, tileH); }
    if( posX ==-2 && posY == 0 ){ return CGRectMake(centerW+(tileW/2)*2 - (tileW/7)*2, centerH-(tileH*1.0) + (tileH/7)*2, tileW, tileH); }
    if( posX ==-2 && posY ==-1 ){ return CGRectMake(centerW+(tileW/2) - (tileW/7), centerH-(tileH*1.5) + (tileH/7)*3, tileW, tileH); }
    
#endif
    
    // Walls
    
#if TARGET_OS_IPHONE
    
    if( posX == 2 && posY ==-1 ){ return CGRectMake(centerW-(tileW/2)*3, centerH+(tileH*0.5)*-0.12, tileW, tileH); }
    if( posX == 2 && posY == 0 ){ return CGRectMake(centerW-(tileW/2)*2, centerH+(tileH*0.5)*-0.45, tileW, tileH); }
    if( posX == 2 && posY == 1 ){ return CGRectMake(centerW-(tileW/2)*1, centerH+(tileH*0.5)*-0.79, tileW, tileH); }
    if( posX == 2 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*0.5, centerH+(tileH*0.5)*-1, tileW, tileH); }
    
    if( posX ==-1 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*-3, centerH+(tileH*0.5)*-0.12, tileW, tileH); }
    if( posX == 0 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*-2, centerH+(tileH*0.5)*-0.45, tileW, tileH); }
    if( posX == 1 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*-1, centerH+(tileH*0.5)*-0.79, tileW, tileH); }
    
#else
    
    if( posX == 2 && posY ==-1 ){ return CGRectMake(centerW-((tileW/2)*2.4) + (tileW/7), centerH +(0.5*tileH*0.35), tileW, tileH); }
    if( posX == 2 && posY == 0 ){ return CGRectMake(centerW-tileW + (tileW/3.5), centerH +(tileH*0.351), tileW, tileH); }
    if( posX == 2 && posY == 1 ){ return CGRectMake(centerW-(tileW/2) + (tileW/7), centerH +(1.5*tileH*0.351), tileW, tileH); }
    if( posX == 2 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*0.5, (centerH + tileH) + centerH+(tileH*0.5)*-1 - 80, tileW, tileH); }
    
    if( posX ==-1 && posY == 2 ){ return CGRectMake(centerW+(tileW*0.35), centerH +(1.5*tileH*0.351), tileW, tileH); }
    if( posX == 0 && posY == 2 ){ return CGRectMake(centerW+(tileW*0.7), centerH +(tileH*0.351), tileW, tileH); }
    if( posX == 1 && posY == 2 ){ return CGRectMake(centerW+(tileW/2)*2.108, centerH +(0.5*tileH*0.35), tileW, tileH); }
    
#endif

    return CGRectMake(0, 0, 0, 0);
}

@end
