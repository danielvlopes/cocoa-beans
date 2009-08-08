//
//  Application.m
//  ViewSwapping
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"


@implementation Application
- (void)awakeFromNib
{
	// set toolbar delegation
	toolbarHandler = [[ToolbarDelegation alloc] init];
	[toolbar setDelegate:toolbarHandler];
	
	// show the first view
	NSToolbarItem *button = [[toolbar items] objectAtIndex:1];
	[toolbar setSelectedItemIdentifier:[button itemIdentifier]];
	[self changeView:button];
	
	// increase bottom border
	[window setContentBorderThickness:20.0f forEdge:NSMinYEdge];
}

- (id)init
{
	[super init];
	
	// instantiate the controllers array
	availableControllers = [[NSMutableArray alloc] init];
	
	// define a controller
	NSViewController *controller;
	
	// instantiate each controller and add it to the 
	// controllers list; make sure the controllers
	// are added respecting the tag (check it out the
	// toolbar button tag number)
	controller = [[ImagesController alloc] init];
	[availableControllers addObject:controller];
	[controller release];
	
	controller = [[NotesController alloc] init];
	[availableControllers addObject:controller];
	[controller release];
	
	controller = [[FillController alloc] init];
	[availableControllers addObject:controller];
	[controller release];
	
	return self;
}

- (IBAction)changeView:(id)sender
{
	int i = [sender tag];
	
	NSViewController *controller = [availableControllers objectAtIndex:i];
	NSView *view = [controller view];
	
	// calculate window size
	NSSize currentSize = [[viewHolder contentView] frame].size;
	NSSize newSize = [view frame].size;
	
	NSLog(@"current view: %.0f, %.0f", currentSize.width, currentSize.height);
	NSLog(@"new view: %.0f, %.0f", newSize.width, newSize.height);
	
	float deltaWidth = newSize.width - currentSize.width;
	float deltaHeight = newSize.height - currentSize.height;
	
	NSLog(@"deltas: %.0f, %.0f", deltaWidth, deltaHeight);
	
	NSRect frame = [window frame];
	
	NSLog(@"current frame: %.0f, %.0f", frame.size.width, frame.size.height);
	
	frame.size.height += deltaHeight;
	frame.origin.y -= deltaHeight;
	frame.size.width += deltaWidth;
	
	NSLog(@"new frame: %.0f, %.0f", frame.size.width, frame.size.height);
	
	// unset current view
	[viewHolder setContentView:nil];
	
	// do animate
	[window setFrame:frame 
			 display:YES 
			 animate:YES];
	
	// set requested view after resizing the window
	[viewHolder setContentView:view];
	
	[view setNextResponder:controller];
	[controller setNextResponder:viewHolder];
}

- (void)dealloc
{
	[toolbarHandler release];
	[availableControllers release];
	[super dealloc];
}
@end
