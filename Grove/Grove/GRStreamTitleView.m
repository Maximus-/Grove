//
//  GRStreamTitleView.m
//  Grove
//
//  Created by Max Shavrick on 4/16/16.
//  Copyright © 2016 Milo. All rights reserved.
//

#import "GRStreamTitleView.h"
#import "GRSmallCapsLabel.h"

@implementation GRStreamTitleView {
	GRSmallCapsLabel *label;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self setBackgroundColor:[UIColor clearColor]];
		label = [[GRSmallCapsLabel alloc] init];
		[label setText:GRLocalizedString(@"activity", nil, nil)];
		[self addSubview:label];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[label setFrame:CGRectMake(0, 10, self.frame.size.width, 15)];
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
}

@end
