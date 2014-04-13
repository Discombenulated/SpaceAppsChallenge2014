//
//  ThemeController.m
//  Sky Snapper
//
//  Created by David Stanton on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "ThemeController.h"

@implementation ThemeController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(IBAction) unwindToThemeController:(UIStoryboardSegue*)unwindSegue {
    NSLog(@"Unwound");
}



@end
