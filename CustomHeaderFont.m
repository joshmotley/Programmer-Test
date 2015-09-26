//
//  CustomHeaderFont.m
//  IOSProgrammerTest
//
//  Created by Joshua Motley on 9/23/15.
//  Copyright (c) 2015 AppPartner. All rights reserved.
//

#import "CustomHeaderFont.h"

@implementation CustomHeaderFont

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib { [super awakeFromNib]; self.font = [UIFont fontWithName:@"Machinato-Light" size:self.font.pointSize]; }

@end
