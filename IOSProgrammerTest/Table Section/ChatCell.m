//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;


@end

@implementation ChatCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)loadWithData:(ChatData *)chatData
{
    self.usernameLabel.text = chatData.username;
    self.messageTextView.text = chatData.message;
    self.avatarView.layer.cornerRadius = 25;
    self.avatarView.clipsToBounds = YES;
    
 
    

    
    NSURL *avatarURL = [NSURL URLWithString:chatData.avatar_url];
    NSData *avatarData = [NSData dataWithContentsOfURL:avatarURL];
    self.avatarView.image =  [UIImage imageWithData:avatarData];
    
  
    
}
@end
