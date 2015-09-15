//
//  GRViewModel.m
//  Grove
//
//  Created by Max Shavrick on 8/24/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import "GRViewModel.h"

@implementation GRViewModel

- (instancetype)init {
	if ((self = [super init])) {
		[self populateCachedData];
		[self requestNewData];
	}
	return self;
}

- (void)populateCachedData {
	
}

- (void)requestNewData {
	
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (NSInteger)numberOfSections {
	return 0;
}

- (NSString *)titleForSection:(NSInteger)section {
	return nil;
}

@end
