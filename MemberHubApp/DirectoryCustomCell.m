//
//  DirectoryCustomCell.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/16/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "DirectoryCustomCell.h"

@implementation DirectoryCustomCell
@synthesize DirectoryImageView;
@synthesize directoryLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
