//
//  HomeViewController.m
//  Sky Snapper
//
//  Created by Ben Noble on 11/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "HomeViewController.h"

#import "UploadViewController.h"

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
     } else if ([segue.identifier isEqualToString:@"UploadSegue"]) {
         NSLog(@"Uploading");
         UploadViewController* uploadController = segue.destinationViewController;
         uploadController.uploadImage = chosenImage;
     }
 }

bool reverseAnimate = NO;

-(void) animateBackground {
    //NSLog(@"Moving");
    long step = 1.0f;
    CGRect imageFrame = self.backgroundImage.frame;
    
    if (reverseAnimate){
        imageFrame.origin = CGPointMake(imageFrame.origin.x + step, imageFrame.origin.y);
        if (imageFrame.origin.x >= 0.0) {
            reverseAnimate = NO;
        }
    } else {
        imageFrame.origin = CGPointMake(imageFrame.origin.x - step, imageFrame.origin.y);
        if (imageFrame.origin.x - step < 0 - imageFrame.size.width + self.view.frame.size.width) {
            reverseAnimate = YES;
        }
    }
    self.backgroundImage.frame = imageFrame;
}

UIImage* chosenImage = nil;

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"Photo chosen");
    chosenImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self performSegueWithIdentifier:@"UploadSegue" sender:nil];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) unwindToHome:(UIStoryboardSegue*)unwindSegue {
    NSLog(@"Unwound");
}

@end
