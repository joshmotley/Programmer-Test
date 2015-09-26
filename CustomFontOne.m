//
//  CustomFontOne.m
//  IOSProgrammerTest
//
//  Created by Joshua Motley on 9/23/15.
//  Copyright (c) 2015 AppPartner. All rights reserved.
//

#import "CustomFontOne.h"

@implementation CustomFontOne

- (void)awakeFromNib { [super awakeFromNib]; self.font = [UIFont fontWithName:@"Machinato" size:self.font.pointSize]; }

@end
