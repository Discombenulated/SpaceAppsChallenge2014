//
//  HomeViewController.h
//  Sky Snapper
//
//  Created by Ben Noble on 11/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAnimatedViewController.h"

@interface HomeViewController : BaseAnimatedViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) IBOutlet UIButton* snapButton;

-(IBAction) unwindToHome: (UIStoryboardSegue*)unwindSegue;
@end
