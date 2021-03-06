//
//  GSActor.m
//  GroveSupport
//
//  Created by Max Shavrick on 8/18/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import "GSActor.h"
#import "GroveSupportInternal.h"

@implementation GSActor

- (void)_configureWithDictionary:(NSDictionary *)dictionary {
	[super _configureWithDictionary:dictionary];
	
	GSAssign(dictionary, @"login", _username);
	GSAssign(dictionary, @"gravatar_id", _gravatarIdentifier);
	
	GSURLAssign(dictionary, @"avatar_url", _avatarURL);
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	if ((self = [super initWithCoder:coder])) {
		GSDecodeAssign(coder, @"username", _username);
		GSDecodeAssign(coder, @"gravatarIdentifier", _gravatarIdentifier);
		GSDecodeAssign(coder, @"avatarURL", _avatarURL);
		GSDecodeAssign(coder, @"directURL", _directURL);
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[super encodeWithCoder:coder];
	GSEncode(coder, @"username", _username);
	GSEncode(coder, @"gravatarIdentifier", _gravatarIdentifier);
	GSEncode(coder, @"avatarURL", _avatarURL);
	GSEncode(coder, @"directURL", _directURL);
}

@end
