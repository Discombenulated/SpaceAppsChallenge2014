//
//  PollutionThemeController.h
//  Sky Snapper
//
//  Created by David Stanton on 13/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseAnimatedViewController.h"

@interface PollutionThemeController : BaseAnimatedViewController
-(IBAction) unwindToPollutionController: (UIStoryboardSegue*)unwindSegue;
@end
