//
//  GroveSupportInternal.h
//  GroveSupport
//
//  Created by Max Shavrick on 8/25/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#ifndef GroveSupport_GroveSupportInternal_h
#define GroveSupport_GroveSupportInternal_h

static NSString *const GSClientIdentifier = @"1e27f6fb656a735a3a9c";
static NSString *const GSClientSecret = @"192812c39ecc20317489a9b8c3d62989aa7e287f";

// Perhaps move these to a server, should never ship with these tokens

#import "GroveSupport.h"

#import "GSObjectInternal.h"
#import "GSUserInternal.h"
#import "GSNotificationInternal.h"
#import "GSRepositoryInternal.h"
#import "GSActorInternal.h"
#import "GSIssueInternal.h"
#import "GSCommentInternal.h"
#import "GSGistInternal.h"

#define PREFER_GIVEN_API_URLS 0
// fallback, if API didn't give us URL for some data, form it ourself
// versus always forming it ourself.

#endif
