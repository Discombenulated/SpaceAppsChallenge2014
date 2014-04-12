//
//  HomeViewController.m
//  Sky Snapper
//
//  Created by Ben Noble on 11/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "HomeViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize snapButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //snapButton.layer.borderColor = [UIColor whiteColor].CGColor;
    //snapButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    //snapButton.layer.borderWidth = 1.0;
    //snapButton.layer.cornerRadius = 10;
}

NSTimer* backgroundAnimationTimer;

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    backgroundAnimationTimer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(animateBackground) userInfo:nil repeats:true];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [backgroundAnimationTimer invalidate];
    backgroundAnimationTimer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"SnapPictureSegue"]) {
         UIImagePickerController *pickerController = segue.destinationViewController;
         pickerController.delegate = self;
         pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
         pickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
         pickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
     }
 }

bool reverseAnimate = NO;

-(void) animateBackground {
    NSLog(@"Moving");
    long step = 1.0f;
    CGRect imageFrame = self.backgroundImage.frame;
    
    if (reverseAnimate){
        imageFrame.origin = CGPointMake(imageFrame.origin.x + step, imageFrame.origin.y);
        if (imageFrame.origin.x < 1.0) {
            reverseAnimate = NO;
        }
    } else {
        imageFrame.origin = CGPointMake(imageFrame.origin.x - step, imageFrame.origin.y);
        if (imageFrame.origin.x - step > imageFrame.size.width - self.view.frame.size.width) {
            reverseAnimate = YES;
        }
    }
    self.backgroundImage.frame = imageFrame;
}

@end
