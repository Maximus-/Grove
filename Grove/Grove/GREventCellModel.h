//
//  GREventCellModel.h
//  Grove
//
//  Created by Max Shavrick on 9/10/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GSEvent, GRStreamEventCell;
@interface GREventCellModel : NSObject
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, assign) CGSize avatarSize;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, strong, nonnull) GSEvent *event;
@property (nonatomic, weak, nullable) GRStreamEventCell *tableCell;
- (nonnull instancetype)initWithEvent:(GSEvent *__nonnull)event;

- (nonnull NSAttributedString *)eventString;
- (nonnull NSString *)username;
- (nonnull UIImage *)imageIcon;
- (nonnull NSString *)dateStringFromEvent;
- (CGFloat)requiredTableCellHeight;
@end
