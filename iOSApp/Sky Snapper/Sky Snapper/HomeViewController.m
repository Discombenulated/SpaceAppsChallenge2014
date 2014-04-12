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

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
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

- (IBAction)buttonPressed:(id)sender {
    
    UIViewController *otherVC = [[UIStoryboard storyboardWithName:@"Learning_iPhone" bundle:nil] instantiateInitialViewController]; //Or get a VC by its identifier
    
    [self.navigationController pushViewController:otherVC animated:YES];
}

@end
