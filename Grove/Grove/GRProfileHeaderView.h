//
//  GRProfileHeaderView.h
//  Grove
//
//  Created by Max Shavrick on 8/24/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GSUser;
@interface GRProfileHeaderView : UIView
- (void)configureWithUser:(GSUser *)user;
@end
