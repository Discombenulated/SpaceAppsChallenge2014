//
//  HomeViewController.h
//  Sky Snapper
//
//  Created by Ben Noble on 11/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UIImagePickerControllerDelegate>
@property (nonatomic, strong) IBOutlet UIButton* snapButton;
@property (nonatomic, strong) IBOutlet UIImageView* backgroundImage;
@end
