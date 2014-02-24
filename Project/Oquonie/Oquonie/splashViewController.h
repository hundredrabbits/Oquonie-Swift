//
//  splashViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface splashViewController : UIViewController
	@property (strong, nonatomic) IBOutlet UIImageView *splashLogoOquonie;
	@property (strong, nonatomic) IBOutlet UIButton *buttonErase;
	@property (strong, nonatomic) IBOutlet UIImageView *eraseImage;
	@property (strong, nonatomic) IBOutlet UILabel *deleteSave;
	- (IBAction)eraseButton:(id)sender;
@end

int splashSlide = 1;
int gameEraseState;

NSTimer *slideTimer;