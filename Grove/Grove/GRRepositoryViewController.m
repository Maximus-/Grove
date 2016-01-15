//
//  GRRepositoryViewController.m
//  Grove
//
//  Created by Max Shavrick on 9/26/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import "GRRepositoryViewController.h"
#import "GRRepositoryHeaderView.h"
#import "GRRepositoryFileBrowserView.h"
#import "GRRepositoryViewSelector.h"

#import <GroveSupport/GroveSupport.h>

static CGFloat GRHeaderSizeRatio = .10f;

@implementation GRRepositoryViewController {
	GRRepositoryHeaderView *header;
	GRRepositoryViewSelector *viewSelector;
	GRRepositoryFileBrowserView *fileBrowser;

}

- (instancetype)init {
	if ((self = [super init])) {
		header = [[GRRepositoryHeaderView alloc] init];
		[header setBackgroundColor:GSRandomUIColor()];
		
		viewSelector = [[GRRepositoryViewSelector alloc] init];
		
		fileBrowser = [[GRRepositoryFileBrowserView alloc] init];
		// Notes about this view:
		// Consider perhaps User/Reponame only when its a reasonable length
		// otherwise Reponame\n User
	}
	return self;
}

- (void)setRepository:(GSRepository *)newRepository {
	[_repository removeObserver:self forKeyPath:GSUpdatedDateKey];

	_repository = newRepository;
	[_repository addObserver:self forKeyPath:GSUpdatedDateKey options:0 context:NULL];
	[_repository update];
	
	[fileBrowser setRepository:newRepository];
	[header setRepositoryName:_repository.name];
	[header setRepositoryOwner:_repository.owner.username];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
	NSLog(@"Repository has new data %@:%@:%@", object, keyPath, change);
}

- (void)viewDidLoad {
	[super viewDidLoad];

	for (UIView *v in @[header, fileBrowser, viewSelector]) {
		[self.view addSubview:v];
	}
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	
	CGFloat verticalOffsetUsed = GRStatusBarHeight();
	
	[header setFrame:CGRectMake(0, verticalOffsetUsed, self.view.frame.size.width, ceilf(self.view.frame.size.height * GRHeaderSizeRatio))];
	
	verticalOffsetUsed += header.frame.size.height;
	
	[viewSelector setFrame:CGRectMake(0, verticalOffsetUsed, self.view.frame.size.width, 44.0f)];
	
	verticalOffsetUsed += viewSelector.frame.size.height;
	
	[fileBrowser setFrame:CGRectMake(0, verticalOffsetUsed, self.view.frame.size.width, self.view.frame.size.height - verticalOffsetUsed)];
}

- (void)dealloc {
	[self setRepository:nil];
}

@end
