//
//  GRRepositoryInfoModel.m
//  Grove
//
//  Created by Max Shavrick on 1/16/16.
//  Copyright © 2016 Milo. All rights reserved.
//

#import "GRRepositoryInfoModel.h"

#import <GroveSupport/GSRepository.h>

@implementation GRRepositoryInfoModel {
	GSRepository *repository;
	BOOL hasHomepage;
	BOOL hasDescription;
}

- (instancetype)initWithRepository:(GSRepository *)repo {
	if ((self = [super init])) {
		repository = repo;
		hasHomepage = (!![repo browserHomepageURL]);
		hasDescription = (!![repo userDescription]);
	}
	return self;
}

- (NSUInteger)numberOfSections {
	return 1;
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section {
	return 4;
}

- (NSString *)sectionLabelForSection:(NSUInteger)section {
	NSString *label = nil;
	switch (section) {
		case 0:
			label = GRLocalizedString(@"description", nil, nil);
			break;
		case 1:
			label = GRLocalizedString(@"readme", nil, nil);
			break;
	}
	return [label uppercaseString];
}

@end
