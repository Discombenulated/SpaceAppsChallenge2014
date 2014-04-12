//
//  ThemeController.m
//  Sky Snapper
//
//  Created by David Stanton on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "ThemeController.h"

@implementation ThemeController
@synthesize ButtonClick;
- (IBAction)buttonPressed:(id)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Storyboard_iPhone" bundle:nil];
    UIViewController* initialHelpView = [storyboard instantiateInitialViewController];
    
    initialHelpView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:initialHelpView animated:YES];
}


@end
