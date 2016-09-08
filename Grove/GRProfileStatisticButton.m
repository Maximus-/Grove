//
//  GRProfileStatisticButton.m
//  Grove
//
//  Created by Max Shavrick on 8/26/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import "GRProfileStatisticButton.h"

#import <GroveSupport/GroveSupport.h>

@implementation GRProfileStatisticButton {
	UILabel *text;
	UILabel *subText;
}

- (void)setText:(NSString *)_text {
	[text setText:_text];
}

- (void)setSubText:(NSString *)_text {
	[subText setText:_text];
}

- (void)_commonInit {
	text = [[UILabel alloc] init];
	subText = [[UILabel alloc] init];

	[text setFont:[UIFont boldSystemFontOfSize:17]];
	[text setTextAlignment:NSTextAlignmentCenter];
	[text setMinimumScaleFactor:0.5];
	
	[subText setTextAlignment:NSTextAlignmentCenter];
	[subText setFont:[UIFont systemFontOfSize:14]];
	[subText setMinimumScaleFactor:0.8];
	
	[text setBackgroundColor:[UIColor clearColor]];
	[subText setBackgroundColor:[UIColor clearColor]];
	
	[self setBackgroundColor:[UIColor greenColor]];
	
	[self addSubview:text];
	[self addSubview:subText];
}

- (instancetype)init {
	if ((self = [super init])) {
		[self _commonInit];
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	[[UIColor whiteColor]  setFill];
	UIRectFill(rect);
}

- (void)layoutSubviews {
	[super layoutSubviews];
	const CGFloat divisionFactor = 0.60;
	[text setFrame:CGRectMake(0, 5, self.frame.size.width, floorf(divisionFactor * self.frame.size.height))];
	[subText setFrame:CGRectMake(0, floorf(divisionFactor * self.frame.size.height), self.frame.size.width, self.frame.size.height - (floorf(divisionFactor * self.frame.size.height)))];
}

@end