//
//  BaseLearningView.m
//  Sky Snapper
//
//  Created by David Stanton on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "BaseAnimatedViewController.h"

@interface BaseAnimatedViewController ()

@end

@implementation BaseAnimatedViewController
bool reverseAnimate = NO;

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
    backgroundAnimationTimer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(animateBackground) userInfo:nil repeats:true];
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [backgroundAnimationTimer invalidate];
    backgroundAnimationTimer = nil;
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
