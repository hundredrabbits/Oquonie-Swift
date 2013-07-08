//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xxiivvViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *moveTL;
@property (strong, nonatomic) IBOutlet UIButton *moveTR;
@property (strong, nonatomic) IBOutlet UIButton *moveBL;
@property (strong, nonatomic) IBOutlet UIButton *moveBR;

- (IBAction)moveTL:(id)sender;
- (IBAction)moveTR:(id)sender;
- (IBAction)moveBL:(id)sender;
- (IBAction)moveBR:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *floor11;
@property (strong, nonatomic) IBOutlet UIImageView *floor01;
@property (strong, nonatomic) IBOutlet UIImageView *floore1;
@property (strong, nonatomic) IBOutlet UIImageView *floor10;
@property (strong, nonatomic) IBOutlet UIImageView *floor00;
@property (strong, nonatomic) IBOutlet UIImageView *floore0;
@property (strong, nonatomic) IBOutlet UIImageView *floor1e;
@property (strong, nonatomic) IBOutlet UIImageView *floor0e;
@property (strong, nonatomic) IBOutlet UIImageView *flooree;










@end

int userPositionX;
int userPositionY;