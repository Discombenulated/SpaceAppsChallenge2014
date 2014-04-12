//
//  UploadViewController.h
//  Sky Snapper
//
//  Created by Ben Noble on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIImageView* uploadImageView;
@property (nonatomic, strong) IBOutlet UIProgressView* progressView;

@property (nonatomic, strong) UIImage* uploadImage;
@end
