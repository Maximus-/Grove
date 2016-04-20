//
//  GRTableViewController.m
//  Grove
//
//  Created by Max Shavrick on 1/15/16.
//  Copyright © 2016 Milo. All rights reserved.
//

#import "GRTableViewController.h"
#import "GRDrawerMenuItem.h"

@implementation GRTableViewController {
	__block NSArray *drawerMenuItems;
}

- (NSArray<GRDrawerMenuItem *> *)_generateDrawerMenuItems {
	return nil;
}

- (NSArray<GRDrawerMenuItem *> *)drawerMenuItems {
	static dispatch_once_t token;
	dispatch_once(&token, ^ {
		drawerMenuItems = [self _generateDrawerMenuItems];
	});
	
	return drawerMenuItems;
}

@end
