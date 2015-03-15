//
//  Heart.m
//  Space Invaders
//
//  Created by Herrick WOLBER on 10/05/2014.
//  Copyright (c) 2014 Herrick Wolber. All rights reserved.
//

#import "Heart.h"

@implementation Heart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"pixelheart3.png"]];
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

@end
