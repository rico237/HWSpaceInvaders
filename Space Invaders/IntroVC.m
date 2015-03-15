//
//  IntroVC.m
//  Space Invaders
//
//  Created by Herrick Wolber on 06/09/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import "IntroVC.h"

@interface IntroVC ()

@end

@implementation IntroVC

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToGame:(id)sender {
    UIStoryboard *gameStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController *initGameVC = [gameStoryboard instantiateInitialViewController];
    
    initGameVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:initGameVC animated:YES completion:NULL];
}

- (IBAction)goToSettings:(id)sender {
    UIStoryboard *settingsStoryboard = [UIStoryboard storyboardWithName:@"Settings_iPhone" bundle:nil];
    UIViewController *initSettingsVC = [settingsStoryboard instantiateInitialViewController];
    
    initSettingsVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:initSettingsVC animated:YES completion:NULL];
}
@end
