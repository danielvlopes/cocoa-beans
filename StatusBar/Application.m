//
//  Application.m
//  StatusBar
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"


@implementation Application
- (void)awakeFromNib
{
	// setting icon for status item
	NSImage *onIcon = [NSImage imageNamed:@"on.png"];
	NSImage *offIcon = [NSImage imageNamed:@"off.png"];
	
	// setting status menu
	NSMenu *statusMenu = [[NSMenu alloc] init];
	[statusMenu setAutoenablesItems:YES];
	
	// setting status menu items
	[statusMenu addItemWithTitle:@"Go to my profile" action:nil keyEquivalent:@""];
	[statusMenu addItemWithTitle:@"Preferences" action:nil keyEquivalent:@""];
	[statusMenu addItem: [NSMenuItem separatorItem]];
	[statusMenu addItemWithTitle:@"Quit" action:nil keyEquivalent:@""];
	
	// instantiate status bar and set some properties
	NSStatusItem *statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setHighlightMode:YES];
	[statusItem setMenu:statusMenu];
	[statusItem setImage:offIcon];
	[statusItem setAlternateImage:onIcon];
}
@end
