//
//  GRRepositoryViewController.m
//  Grove
//
//  Created by Max Shavrick on 9/26/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import "GRRepositoryViewController.h"

#import <GroveSupport/GroveSupport.h>

@implementation GRRepositoryViewController {
	GSRepository *repository;
	UITableView *tableView;
}

- (instancetype)init {
	if ((self = [super init])) {
		tableView = [[UITableView alloc] init];
	}
	return self;
}

- (void)setRepository:(GSRepository *)newRepository {
	if (repository) {
		[repository removeObserver:self forKeyPath:GSUpdatedDataKey];
	}
	repository = newRepository;
	[repository addObserver:self forKeyPath:GSUpdatedDataKey options:0 context:NULL];
	[repository update];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
	NSLog(@"Repository has new data %@:%@:%@", object, keyPath, change);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:tableView];
	[tableView setFrame:self.view.bounds];
}

@end
