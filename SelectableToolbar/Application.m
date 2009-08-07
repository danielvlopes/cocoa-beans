//
//  Application.m
//  SelectableToolbar
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"


@implementation Application
- (void)awakeFromNib
{
	// set the delegation method.
	// in practice, you'll set a new delegation class instead of
	// the controller class
	[toolbar setDelegate:self];
	
	// activate the first button
	NSToolbarItem *item = [[toolbar items] objectAtIndex:1];
	[toolbar setSelectedItemIdentifier:[item itemIdentifier]];
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)theItem
{
	// to activate your toolbar buttons, you need to return YES; otherwise
	// the button will be grayed-out disabled.
    return YES;
}

- (NSArray *)toolbarSelectableItemIdentifiers: (NSToolbar *)theToolbar;
{
	// you should return a list with all selectable toolbar buttons.
	// make sure you're returning a list of identifiers and not the
	// items!
	NSMutableArray *identifiers = [[NSMutableArray alloc] init];
	
	for (NSToolbarItem *item in [theToolbar items]) {
		[identifiers addObject:[item itemIdentifier]];
	}
	
	return [identifiers autorelease];
}

- (void)buttonClicked: (id)sender
{
	// this method is associated with every toolbar button; of course, you have
	// to change this behavior. or not.
	
	// check if the current toolbar button is already selected
	if ([[toolbar selectedItemIdentifier] isEqualToString:[sender itemIdentifier]]) {
		NSLog(@"already on %@ tab", [sender label]);
		return;
	}
	
	// to select the toolbar button just use the following method
	[toolbar setSelectedItemIdentifier:[sender itemIdentifier]];
}
@end
