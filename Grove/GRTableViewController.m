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
	@synchronized (drawerMenuItems) {
		if (!drawerMenuItems) {
			drawerMenuItems = [self _generateDrawerMenuItems];
		}
	}

	return drawerMenuItems;
}

@end
