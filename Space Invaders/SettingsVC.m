//
//  SettingsVC.m
//  Space Invaders
//
//  Created by Herrick Wolber on 15/09/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import "SettingsVC.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

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

- (IBAction)backToMenu:(id)sender {
    UIStoryboard *gameStoryboard = [UIStoryboard storyboardWithName:@"Intro_iphone" bundle:nil];
    UIViewController *initGameVC = [gameStoryboard instantiateInitialViewController];
    
    initGameVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:initGameVC animated:YES completion:NULL];
}
@end
