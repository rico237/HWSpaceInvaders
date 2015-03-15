//
//  Ship.m
//  Space Invaders
//
//  Created by Herrick Wolber on 30/08/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import "Ship.h"

@implementation Ship

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"ship.png"]];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

//getters = retourne les valeurs privates
-(CGPoint) currentPoint{
    return currentPoint;
}
-(CGPoint) previousPoint{
    return previousPoint;
}
-(CGFloat) spaceXVelocity{
    return spaceXVelocity;
}
-(CGFloat) spaceYVelocity{
    return spaceYVelocity;
}
-(NSOperationQueue*) queue{
    return queue;
}
-(NSDate*) lastUpdateTime{
    return lastUpdateTime;
}

//setters = met a jour les valeurs private

-(void) setCurrentPoint : (CGPoint) input{
    currentPoint=input;
}
-(void) setPreviousPoint : (CGPoint) input{
    previousPoint=input;
}
-(void) setSpaceXVelocity : (CGFloat) input{
    spaceXVelocity = input;
}
-(void) setSpaceYVelocity : (CGFloat) input{
    spaceYVelocity = input;
}
-(void) setQueue : (NSOperationQueue*) input{
    queue = input;
}
-(void) setLastUpdateTime : (NSDate*) input{
    lastUpdateTime=input;
}

@end