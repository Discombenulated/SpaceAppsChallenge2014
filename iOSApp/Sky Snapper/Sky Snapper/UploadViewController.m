//
//  UploadViewController.m
//  Sky Snapper
//
//  Created by Ben Noble on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "UploadViewController.h"

#import "ResultViewController.h"

@interface UploadViewController ()

@end

@implementation UploadViewController
@synthesize uploadImage, uploadImageView, progressView;

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
    uploadImageView.image = uploadImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSTimer* forwardTimer = nil;

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.progressView.progress = 0.0f;
    forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(forwardToResult) userInfo:nil repeats:YES];
}

-(void) viewWillDisappear:(BOOL)animated {
    [forwardTimer invalidate];
    forwardTimer = nil;
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ResultSegue"]) {
        NSLog(@"Finished uploading");
        ResultViewController* resultController = segue.destinationViewController;
        resultController.image = self.uploadImage;
    }
}

long step = 0.1f;

-(void) forwardToResult{
    if (self.progressView.progress >= 1.0f){
        [forwardTimer invalidate];
        forwardTimer = nil;
        [self performSegueWithIdentifier:@"ResultSegue" sender:nil];
    }
    else {
        [self performSelectorOnMainThread:@selector(setLoaderProgress) withObject:nil waitUntilDone:NO];
    }
}

-(void) setLoaderProgress{
    NSLog(@"Setting progress: %f", self.progressView.progress + step);
    [self.progressView setProgress:self.progressView.progress + step animated:YES];
}

@end
