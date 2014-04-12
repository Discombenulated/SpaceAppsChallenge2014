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
