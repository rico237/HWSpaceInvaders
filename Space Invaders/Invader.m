//
//  Invader.m
//  Space Invaders
//
//  Created by Herrick Wolber on 28/08/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import "Invader.h"

@implementation Invader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"spaceinvader.png"]];
    }
    return self;
}

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
