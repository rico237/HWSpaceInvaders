//
//  Invader.h
//  Space Invaders
//
//  Created by Herrick Wolber on 28/08/13.
//  Copyright (c) 2013 Herrick Wolber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Invader : UIImageView{
    CGPoint currentPoint;
    CGPoint previousPoint;
    CGFloat spaceXVelocity;
    CGFloat spaceYVelocity;
    NSOperationQueue *queue;
    NSDate *lastUpdateTime;
}

//getters
-(CGPoint) currentPoint;
-(CGPoint) previousPoint;
-(CGFloat) spaceXVelocity;
-(CGFloat) spaceYVelocity;
-(NSOperationQueue*) queue;
-(NSDate*) lastUpdateTime;

//setters
-(void) setCurrentPoint:(CGPoint) input;
-(void) setPreviousPoint:(CGPoint) input;
-(void) setSpaceXVelocity:(CGFloat) input;
-(void) setSpaceYVelocity:(CGFloat) input;
-(void) setQueue:(NSOperationQueue*) input;
-(void) setLastUpdateTime:(NSDate*) input;

@end
