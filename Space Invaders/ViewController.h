//
//  ViewController.h
//  Space Invaders
//
//  Created by Herrick Wolber on 21/08/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "Invader.h"
#import "Ship.h"
#import "Heart.h"

#define kUpdateInterval (1.0f / 60.0f)

@interface ViewController : UIViewController <UIActionSheetDelegate>
{
    CGPoint vitesseInvaders;
    NSTimer *timerJeu;
    NSTimer *timerShoot;
    NSTimer *timerInvaderShoot;
    NSTimer *randomTimerInterval;
    UIImageView *tire;
    UIImageView *tireInvader;
    int vitesseShoot;
    BOOL test;
    int totalPoints;
    Invader *tabInvaders[5][5];
    Ship *ship;
    Invader *prem;
    Invader *dernier;
    
    int count;
    int niveau;
}

//Action encleché pour envoyer un shoot
- (IBAction)shootButton:(id)sender;

//infos affiche les informations sur la partie (depart, fin .. etc)
@property (weak, nonatomic) IBOutlet UILabel *infos;
@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UIButton *bouttonShoot;

//elements necessaire au deplacement du vaisseau
@property (assign, nonatomic) CGPoint currentPoint;
@property (assign, nonatomic) CGPoint previousPoint;
@property (assign, nonatomic) CGFloat spaceXVelocity;
@property (assign, nonatomic) CGFloat spaceYVelocity;
@property (assign, nonatomic) CMAcceleration acceleration;
@property (strong, nonatomic) CMMotionManager  *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSDate *lastUpdateTime;

@property (strong, nonatomic) NSMutableArray *lives;

//boucle deplacement des invaders
- (void)boucleJeu;
//affiche les textes de debut de jeu
- (void)initInfos;
//deplace les tires effectues par le spaceShip
- (void)moveShoot;

- (BOOL)tableVide;

@end