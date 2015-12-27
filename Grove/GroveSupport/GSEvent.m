//
//  GSEvent.m
//  GroveSupport
//
//  Created by Max Shavrick on 8/18/15.
//  Copyright (c) 2015 Milo. All rights reserved.
//

#import "GSEvent.h"
#import "GroveSupportInternal.h"

@implementation GSEvent

- (void)_configureWithDictionary:(NSDictionary *)dictionary {
	[super _configureWithDictionary:dictionary];
	
	GSObjectAssign(dictionary, @"actor", _actor, GSActor);
	GSObjectAssign(dictionary, @"repo", _repository, GSRepository);
	
	_createdDate = [self dateFromISO8601String:dictionary[@"created_at"]];
	_publicallyAvailable = [dictionary[@"public"] boolValue];
	_type = [self notificationEventTypeFromString:dictionary[@"type"]];
	
	
	// Begin Event Payload
	
	NSDictionary *payload = nil;
	GSAssign(dictionary, @"payload", payload);
	
	GSAssign(payload, @"push_id", _pushIdentifier);
	GSAssign(payload, @"size", _size);
	GSAssign(payload, @"description", _descriptionMessage);
	GSAssign(payload, @"ref", _ref);
	GSAssign(payload, @"ref_type", _refType);
	GSAssign(payload, @"master_branch", _masterBranch);
	GSAssign(payload, @"pusher_type", _pusherType);
	
	if ([_refType isEqualToString:@"branch"]) {
		_branch = _ref;
	}
	else {
		//GSAssert();
	}
	
	GSObjectAssign(payload, @"comment", _comment, GSComment);
	GSObjectAssign(payload, @"issue", _issue, GSIssue);
	
	GSObjectAssign(payload, @"forkee", _forkee, GSRepository);
	
	NSString *action = nil;
	GSAssign(payload, @"action", action);
	_action = [self actionForString:action];
	
	NSMutableArray *commitsSerialized = [NSMutableArray array];
	
	NSArray *commitsUnserialized = payload[@"commits"];
	if ([commitsUnserialized isKindOfClass:[NSArray class]]) {
		for (NSDictionary *commitPacket in commitsUnserialized) {
			GSCommit *commit = [[GSCommit alloc] initWithDictionary:commitPacket];
			[commitsSerialized addObject:commit];
		}
	}
	_commits = commitsSerialized;

}

- (GSEventAction)actionForString:(NSString *)actionString {
	NSDictionary *const actionMapping = @{
										  @"started"		: @(GSEventActionStarted),
										  @"created"		: @(GSEventActionCreated),
										  @"create"			: @(GSEventActionCreated),
										  @"updated"		: @(GSEventActionUpdated),
										  @"update"			: @(GSEventActionUpdated),
										  @"edited"			: @(GSEventActionEdited),
										  @"opened"			: @(GSEventActionOpened),
										  @"reopened"		: @(GSEventActionReopened),
										  @"assigned"		: @(GSEventActionAssigned),
										  @"unassigned"		: @(GSEventActionUnassigned),
										  @"labeled"		: @(GSEventActionLabeled),
										  @"unlabeled"		: @(GSEventActionUnlabeled),
										  @"published"		: @(GSEventActionPublished),
										  @"added"			: @(GSEventActionAdded),
										  @"removed"		: @(GSEventActionRemoved),
										  @"synchronize"	: @(GSEventActionSynchronized),
										  @"synchronized"	: @(GSEventActionSynchronized),
										  };
	return actionMapping[actionString] ? (GSEventAction)[actionMapping[actionString] intValue] : GSEventActionNone;
}

- (GSEventType)notificationEventTypeFromString:(NSString *)string {
	NSDictionary *const mapping = @{
							   @"CommitCommentEvent"		:@(GSEventTypeCommitComment),
							   @"CreateEvent"				:@(GSEventTypeCreate),
							   @"DeleteEvent"				:@(GSEventTypeDelete),
							   @"DeploymentEvent"			:@(GSEventTypeDeployment),
							   @"DeploymentStatusEvent"		:@(GSEventTypeDeploymentStatus),
							   @"DownloadEvent"				:@(GSEventTypeDownload),
							   @"FollowEvent"				:@(GSEventTypeFollow),
							   @"ForkEvent"					:@(GSEventTypeFork),
							   @"ForkApplyEvent"			:@(GSEventTypeForkApply),
							   @"GistEvent"					:@(GSEventTypeGistEvent),
							   @"GollumEvent"				:@(GSEventTypeGollumEvent),
							   @"IssueCommentEvent"			:@(GSEventTypeIssueComment),
							   @"IssuesEvent"				:@(GSEventTypeIssues),
							   @"MemberEvent"				:@(GSEventTypeMember),
							   @"MembershipEvent"			:@(GSEventTypeMembership),
							   @"PageBuildEvent"			:@(GSEventTypePageBuild),
							   @"PublicEvent"				:@(GSEventTypePublic),
							   @"PullRequestEvent"			:@(GSEventTypePullRequest),
							   @"PullRequestReviewCommentEvent":@(GSEventTypePullRequestReviewComment),
							   @"PushEvent"					:@(GSEventTypePush),
							   @"ReleaseEvent"				:@(GSEventTypeRelease),
							   @"RepositoryEvent"			:@(GSEventTypeRepository),
							   @"StatusEvent"				:@(GSEventTypeStatus),
							   @"TeamAddEvent"				:@(GSEventTypeTeamAdd),
							   @"WatchEvent"				:@(GSEventTypeStar)
							};

	return mapping[string] ? [mapping[string] intValue] : GSEventTypeUnknown;
}

- (NSString *)description {
#if DEBUG
	return [NSString stringWithFormat:@"<%@: %p; id = %@;>", NSStringFromClass([self class]), self, self.identifier];
#else
	return [super description];
#endif
}

@end
