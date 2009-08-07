//
//  Application.m
//  GrowlNotification
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"

@implementation Application
- (void)awakeFromNib
{
	// set the delegation object; in practice, you'll
	// keep this in a separated class
	[GrowlApplicationBridge setGrowlDelegate:self];	
	
	// just display the message
	[self displayNotification];
}

- (void)displayNotification
{
	// this method is not required; is just a helper method!
	[GrowlApplicationBridge notifyWithTitle:@"Learning Cocoa" 
								description:@"So you decided to learn Cocoa! Awesome!"
						   notificationName:@"YourApp"
								   iconData:nil 
								   priority:0 
								   isSticky:NO 
							   clickContext:nil];
}

- (NSDictionary *) registrationDictionaryForGrowl
{
	// this method is required	
	NSArray *notifications;
	notifications = [NSArray arrayWithObject:@"YourApp"];
	
	NSDictionary *dict;
	dict = [NSDictionary dictionaryWithObjectsAndKeys:
			notifications, GROWL_NOTIFICATIONS_ALL,
			notifications, GROWL_NOTIFICATIONS_DEFAULT, nil];
	
	return dict;
}
@end
