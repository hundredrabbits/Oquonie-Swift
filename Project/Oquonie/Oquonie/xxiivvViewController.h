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


@end

int userPositionX;
int userPositionY;