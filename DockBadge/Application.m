//
//  Application.m
//  DockBadge
//
//  Created by Nando Vieira on 8/8/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"


@implementation Application
- (void)awakeFromNib
{
	dock = [[NSApplication sharedApplication] dockTile];
	[self toggleBadgeLabel:nil];
	
	// to test icon bouncing, "build and go" and focus another app
	[NSTimer scheduledTimerWithTimeInterval:5.0
									 target:self 
								   selector:@selector(bounceDockIcon:)
								   userInfo:nil 
									repeats:NO];
}

- (void)bounceDockIcon:(NSTimer *)timer
{
	[NSApp requestUserAttention:NSCriticalRequest];
}

-(IBAction)toggleBadgeLabel:(id)sender
{
	if (![dock badgeLabel] || [[dock badgeLabel] isEqualToString:@""]) {
		[dock setBadgeLabel:@"10"];
		[NSApp requestUserAttention:NSCriticalRequest];
	} else {
		[dock setBadgeLabel:@""];
	}
}

- (void)dealloc
{
	[dock release];
	[super dealloc];
}
@end
