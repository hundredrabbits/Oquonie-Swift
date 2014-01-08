//
//  segueFade.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "segueFade.h"

@implementation segueFade

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView
		transitionWithView:src.navigationController.view
		duration:0.2
		options:UIViewAnimationOptionTransitionCrossDissolve
		animations:^{[src.navigationController pushViewController:dst animated:NO];}
		completion:NULL
	];
}

@end
