//
//  GRLoginViewController.m
//  Grove
//
//  Created by Rocco Del Priore on 8/19/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "GSGitHubEngine.h"
#import "GroveSupport.h"

#import "GRAppDelegate.h"
#import "GRSessionManager.h"
#import "GRLoginViewController.h"

@interface GRLoginViewController () <UITextFieldDelegate>
@end

@implementation GRLoginViewController {
    UIActivityIndicatorView *activityIndicator;
	UITextField *username;
	UITextField *password;
	UIButton *login;
}

#pragma mark - Initialzers

- (instancetype)init {
	self = [super init];
	if (self) {
		self.view.backgroundColor = [UIColor whiteColor];
		
		//Initialize Variables
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		username = [[UITextField alloc] initWithFrame:CGRectZero];
		password = [[UITextField alloc] initWithFrame:CGRectZero];
		login    = [[UIButton alloc] initWithFrame:CGRectZero];
		
		//Set Attributes
		[username setPlaceholder:@"Username"];
		[password setPlaceholder:@"Password"];
		[password setSecureTextEntry:YES];
		[login setBackgroundColor:[UIColor colorWithRed:0.2627 green:0.4784 blue:0.7451 alpha:1.0]];
		[login setTitle:@"Login" forState:UIControlStateNormal];
		[login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[login addTarget:self action:@selector(attemptLogin) forControlEvents:UIControlEventTouchUpInside];
		
		//Add Subviews
		for (UIView *view in @[username, password, login, activityIndicator]) {
			if ([view isKindOfClass:[UITextField class]]) {
				[(UITextField *)view setBackgroundColor:[UIColor grayColor]];
				[(UITextField *)view setTextAlignment:NSTextAlignmentCenter];
				[(UITextField *)view setDelegate:self];
			}
			[self.view addSubview:view];
		}
		
		//Set Constraints
		[username makeConstraints:^(MASConstraintMaker *make) {
			make.centerX.equalTo(self.view);
			make.top.equalTo(self.view).offset(70);
			make.width.equalTo(@250);
			make.height.equalTo(@50);
		}];
		[password makeConstraints:^(MASConstraintMaker *make) {
			make.centerX.equalTo(username);
			make.top.equalTo(username.bottom).offset(15);
			make.width.equalTo(username);
			make.height.equalTo(username);
		}];
		[login makeConstraints:^(MASConstraintMaker *make) {
			make.bottom.equalTo(self.view);
			make.left.equalTo(self.view);
			make.right.equalTo(self.view);
			make.height.equalTo(@90);
		}];
        [activityIndicator makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
        }];
	}
	return self;
}

#pragma mark - Actions

- (void)attemptLogin {
	if (username.text.length > 6 && password.text.length > 6) {
        [activityIndicator startAnimating];
		[[GSGitHubEngine sharedInstance] authenticateUserWithUsername:username.text password:password.text completionHandler:^(GSUser *__nullable user, NSError *__nullable error) {
            [activityIndicator stopAnimating];
			if (user) {
				[[GRSessionManager sharedInstance] createApplicationUserWithUser:user becomeCurrentUser:YES];
				
				[password resignFirstResponder];
				[username resignFirstResponder];
				
				GRAppDelegate *appDelegate = (GRAppDelegate *)[[UIApplication sharedApplication] delegate];
				[appDelegate presentTabBar];
				
				[[GRSessionManager sharedInstance] save];
			}
			
			else {
				_GSAssert(NO, @"%@", error);
			}
		}];
	}
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self attemptLogin];
	return YES;
}

@end
