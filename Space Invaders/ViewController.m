//
//  ViewController.m
//  Space Invaders
//
//  Created by Breaking Apps on 21/08/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize infos;
@synthesize points;
@synthesize bouttonShoot;
@synthesize lives;

int descante = 0, randomShotInterval = 0, nombreVies = 3, auxEnfers = 5, deterDescante = 4;

- (void)viewDidLoad{
    [super viewDidLoad];

    [self setLives];
    
    [self performSelector:@selector(lancerJeu) withObject:nil afterDelay:2.0];
}

- (void)lancerJeu{
    
    [self startValues];
    
    [self initInfos];
    
    [self displayInvaders];
    
    [self displayShip];
    
    [self setLives];
    
    [self deplacementShip];
    
    timerJeu = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(boucleJeu) userInfo:nil repeats:YES];
    
    randomTimerInterval = [NSTimer scheduledTimerWithTimeInterval:1.6 target:self selector:@selector(randomInvaderShoot) userInfo:nil repeats:YES];
}

- (void) nextLevelJeu{
    
    [self startNextLevelValues];
    
    [self initInfos];
    
    [self displayInvaders];
    
    [self displayShip];
    
    [self setLives];
    
    [self deplacementShip];
    
    timerJeu = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(boucleJeu) userInfo:nil repeats:YES];
    
    randomTimerInterval = [NSTimer scheduledTimerWithTimeInterval:1.6 target:self selector:@selector(randomInvaderShoot) userInfo:nil repeats:YES];
}

- (void)initInfos{
    [infos setText:@""];
}

- (void)displayInvaders{
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            
            if (i==0 & j==0) {
                prem = [[Invader alloc] initWithFrame:CGRectMake(i*50+50, j*30+30, 40, 29)];
                prem.currentPoint = prem.center;
                tabInvaders[i][j]= prem;
                [self.view addSubview:prem];
            }
            else if (i==4 & j==4){
                dernier = [[Invader alloc] initWithFrame:CGRectMake(i*50+50, j*30+30, 40, 29)];
                dernier.currentPoint = dernier.center;
                tabInvaders[i][j] = dernier;
                [self.view addSubview:dernier];
            }
            else{
                Invader *myInvader = [[Invader alloc] initWithFrame:CGRectMake(i*50+50, j*30+30, 40, 29)];
                myInvader.currentPoint = myInvader.center;
                tabInvaders[i][j] = myInvader;
                [self.view addSubview:myInvader];
            }
        }

    }
}

- (void)displayShip{
    ship = [[Ship alloc] initWithFrame:CGRectMake(250, 294, 39, 24)];
    [self.view addSubview:ship];
}

- (void)boucleJeu{
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            Invader *myInvader = tabInvaders[i][j];
            myInvader.previousPoint = myInvader.currentPoint;
            myInvader.center = CGPointMake(myInvader.currentPoint.x + vitesseInvaders.x, myInvader.currentPoint.y +vitesseInvaders.y);
            [myInvader setCurrentPoint : myInvader.center];
        }
    }
    
    if (dernier.center.x+30 > self.view.bounds.size.width || prem.center.x - 30 < 0) {
        vitesseInvaders.x = -vitesseInvaders.x;
        [self setInvadersY];
    }
}

- (void)setLives{
    if (!lives)
        lives = [[NSMutableArray alloc] init];
    else{
        for (int i = 0; i < nombreVies; i++) {
            Heart *life = [[Heart alloc] initWithFrame:CGRectMake(i*20, 25, 15, 15)];
            
            [lives addObject:life];
            life = [lives objectAtIndex:i];
            
            [life removeFromSuperview];
        }
        
        [lives removeAllObjects];
    }
    
    for (int i = 0; i < nombreVies; i++) {
        Heart *life = [[Heart alloc] initWithFrame:CGRectMake(i*20, 25, 15, 15)];
 
        [lives addObject:life];
        life = [lives objectAtIndex:i];
        
        [self.view addSubview: life];
    }
}

- (int)setAuxEnfers{
    int deter=0;
    
    for (int j = 4; j>=0; j--) {
        for (int i=0; i<5; i++) {
            Invader *myInvader = tabInvaders[i][j];
            if (!myInvader.isHidden)
                return deter;
        }
        deter++;
    }
    
    return deter;
}

- (void)setInvadersY{
    
    auxEnfers = 5 + [self setAuxEnfers];
    
    if (descante >= auxEnfers) {
        NSLog(@"Set Game Over => Aux Enfers");
        [self setGameOver];
    }else{
        descante ++;
        for (int i=0; i<5; i++) {
            for (int j=0; j<5; j++) {
                Invader *myInvader = tabInvaders[i][j];
                myInvader.previousPoint = myInvader.currentPoint;
                myInvader.center = CGPointMake(myInvader.currentPoint.x + vitesseInvaders.x, myInvader.currentPoint.y +20);
                [myInvader setCurrentPoint : myInvader.center];
            }
        }
        NSLog(@"%d", descante);
    }
}

- (void)setGameOver{
    if (timerJeu.isValid)
        [timerJeu invalidate];
    
    if (randomTimerInterval.isValid)
        [randomTimerInterval invalidate];
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:@"Wanna Restart ?"
                                                   delegate:self
                                          cancelButtonTitle:@"Back To Menu"
                                          otherButtonTitles:@"Restart",nil];
    [bouttonShoot setEnabled:NO];
    [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Bouton BacK To Menu / CancelButton
	if (buttonIndex == 0)
	{
        UIStoryboard *gameStoryboard = [UIStoryboard storyboardWithName:@"Intro_iphone" bundle:nil];
        UIViewController *initGameVC = [gameStoryboard instantiateInitialViewController];
        
        initGameVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:initGameVC animated:YES completion:NULL];
	}
    
    //Bouton Restart
	else if (buttonIndex == 1)
	{
        [self restartValues];
        [self performSelector:@selector(lancerJeu) withObject:nil afterDelay:2.0];
	}
}

- (void)restartValues{
    // re-initialise les variables pour recommencer la partie
    
    bouttonShoot.enabled = YES;
    
    descante = 0; randomShotInterval = 0; nombreVies = 3; auxEnfers = 5; deterDescante = 4;
    
    count = 0;
    test = 1;
    totalPoints = 0;
    niveau = 1;

    [infos setText:@"A toi de jouer"];
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            tabInvaders[i][j].hidden = TRUE;
        }
    }
}

- (void)startValues{
    // re-initialise les variables pour recommencer la partie
    
    bouttonShoot.enabled = YES;
    
    vitesseInvaders = CGPointMake(10, 0);
    
    
    count = 0;
    test = 1;
    totalPoints = 0;
    niveau = 1;
}

- (void)startNextLevelValues{
    if (!bouttonShoot.isEnabled) {
        bouttonShoot.enabled = YES;
    }

    vitesseInvaders = CGPointMake(10, 0);
    
    count = 0;
    test = 1;
}

- (void)nextLevelValues{
    descante = 0; randomShotInterval = 0; auxEnfers = 5; deterDescante = 4;
}

- (void)deplacementShip {
    //deplacement du spaceShip
    self.lastUpdateTime = [[NSDate alloc] init];
    self.currentPoint  = CGPointMake(ship.frame.origin.x, ship.frame.origin.y);
    self.motionManager = [[CMMotionManager alloc]  init];
    self.queue         = [[NSOperationQueue alloc] init];
    self.motionManager.accelerometerUpdateInterval = kUpdateInterval;
    [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error) {
         [(id) self setAcceleration:accelerometerData.acceleration];
         [self performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:NO];
     }];
}

- (void)update {
    
    self.spaceXVelocity = self.spaceXVelocity + (self.acceleration.y);
    
    CGFloat xDelta =self.spaceXVelocity ;
    
    self.currentPoint = CGPointMake(self.currentPoint.x + xDelta, ship.frame.origin.y);
    
    [self moveSpaceShip];
    
    self.lastUpdateTime = [NSDate date];
    
}

- (void)moveSpaceShip {
    
    [self collisionWithBoundaries];

    
    self.previousPoint = self.currentPoint;
    
    CGRect frame = ship.frame;
    frame.origin.x = self.currentPoint.x;
    
    ship.frame = frame;
    
}

- (void)collisionWithBoundaries {
    
    if (self.currentPoint.x < 0) {
        _currentPoint.x = 0;
        self.spaceXVelocity = -(self.spaceXVelocity / 10.0);
    }
    
    if (self.currentPoint.x > self.view.bounds.size.width - ship.image.size.width) {
        _currentPoint.x = self.view.bounds.size.width - ship.image.size.width;
        self.spaceXVelocity = -(self.spaceXVelocity / 10.0);
    }
}

- (void)randomInvaderShoot{
//    Invader *myInvad;
    
//    do {
//        int randomX = [self countInvaders];
//        int valueForArray = arc4random() % randomX;
//        int i=0, j=0;
//        
//        for (int k = 0; k < valueForArray; k++) {
//            
//            if (i<4 && j==4) {
//                j=0;
//                i++;
//            }
//            else if (i<=4 && j<4){
//                j++;
//            }
//        }
//        
//         myInvad = tabInvaders[i][j];
//        
//    } while (myInvad.isHidden);
    
//    tireInvader = [[UIImageView alloc] initWithFrame:CGRectMake(myInvad.frame.origin.x, myInvad.frame.origin.y, 3, 12)];
//    tireInvader.image = [UIImage imageNamed:@"tire.png"];
//    [self.view addSubview:tireInvader];
//    timerInvaderShoot = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveShootInvader) userInfo:nil repeats:YES];
}

- (void)moveShootInvader{
    vitesseShoot = 25;
    tireInvader.center = CGPointMake(tireInvader.center.x, tireInvader.center.y+vitesseShoot);
    
    [self collisionsJoeur];
    
}

- (int)countInvaders{
    int counts = 0;
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            Invader *myInvader = tabInvaders[i][j];
            if (myInvader.isHidden) {
                
            }
            else
                counts++;
        }
    }
    
    return counts;
}

- (void)moveShoot{
    vitesseShoot = 25;
    tire.center = CGPointMake(tire.center.x, tire.center.y-vitesseShoot);
    
    [self collisions];
    
    if ([self tableVide])
    {
        test = 0;
        niveau++;
        
        infos.text = [NSString stringWithFormat:@"Vague n° %i", niveau];
        
        if (timerJeu.isValid) {
            [timerJeu invalidate];
        }
        
        
        if (randomTimerInterval.isValid) {
            [randomTimerInterval invalidate];
        }
        
        [self.motionManager stopAccelerometerUpdates];
        
        ship.hidden=true;
        
        //[self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) ];  Tout Supprimer de la vue.
        [self performSelector:@selector(nextLevelValues) withObject:nil afterDelay:4.0];
        [self performSelector:@selector(nextLevelJeu) withObject:nil afterDelay:4.0];
    }
    
}

//- (void)invalidateTimers{
//    [timerJeu invalidate];
//    
//    [randomTimerInterval invalidate];
//    
//    [self.motionManager stopAccelerometerUpdates];
//    
//    ship.hidden=true;
//}

- (BOOL)tableVide{
    BOOL vide = FALSE;
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            Invader *myInvader = tabInvaders[i][j];
            count++;
            if (myInvader.isHidden) {
                vide = TRUE;
            }
            else
                return FALSE;
        }
    }
    
    return vide;
}

- (BOOL)livesVide{
    if (lives.count == 0)return TRUE;
    
    return FALSE;
}

- (void)collisionsJoeur{
            
    if ((ship.frame.origin.y > tireInvader.center.y && tireInvader.center.y > ship.frame.origin.y - ship.frame.size.height) &&
        (ship.frame.origin.x < tireInvader.center.x && tireInvader.center.x < ship.frame.origin.x + ship.frame.size.width))
    {
        if (timerInvaderShoot.isValid){
            [timerInvaderShoot invalidate];
        }
        tireInvader.hidden = TRUE;
        nombreVies --;
        Heart *life = [lives objectAtIndex:0];
        life.hidden = TRUE;
        [lives removeObject:life];
        NSLog(@"Ship Touche : ");
        NSLog(@"\t NbresVies : %d", nombreVies);
        NSLog(@"\t\tCount du tableau Lives : %lu", (unsigned long)lives.count);
        [self setLives];
        
        if ([self livesVide]) {
            if(timerInvaderShoot.isValid){
                [timerInvaderShoot invalidate];
            }
            
            NSLog(@"Set Game Over => Tableaux Vies Vide");
            [self setGameOver];
        }
    }
    
    if (tireInvader.center.y > self.view.bounds.size.height+50||tireInvader.center.y < -50) {
        if (timerInvaderShoot.isValid) {
            [timerInvaderShoot invalidate];
        }

        tireInvader.hidden = TRUE;
    }
}

- (void)collisions{
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            Invader *myInvader = tabInvaders[i][j];
            if ((myInvader.frame.origin.y > tire.center.y && tire.center.y > myInvader.frame.origin.y - myInvader.frame.size.height)&&(myInvader.frame.origin.x < tire.center.x && tire.center.x < myInvader.frame.origin.x + myInvader.frame.size.width)) {
                
                //Si invader est visible alors il est detruit a l'impact
                if (!myInvader.isHidden) {
                    if (timerShoot.isValid) {
                        [timerShoot invalidate];
                    }
                    
                    test = 1;
                    tire.hidden = TRUE;
                    myInvader.hidden = TRUE ;
                    totalPoints = totalPoints + 10;
                    points.text = [NSString stringWithFormat:@"Points : %i pts" ,totalPoints];
                }
            }
        }
    }

    if (tire.center.y > self.view.bounds.size.height||tire.center.y < 0) {
        if (timerShoot.isValid) {
            [timerShoot invalidate];
        }
        test = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shootButton:(id)sender {
    if (test == 1)
    {
        test = 0;
        tire = [[UIImageView alloc] initWithFrame:CGRectMake(ship.frame.origin.x+20, ship.frame.origin.y, 3, 12)];
        tire.image = [UIImage imageNamed:@"tire.png"];
        [self.view addSubview:tire];
        timerShoot = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveShoot) userInfo:nil repeats:YES];
    }
}

@end
