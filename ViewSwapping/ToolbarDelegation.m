//
//  ToolbarDelegation.m
//  ViewSwapping
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "ToolbarDelegation.h"


@implementation ToolbarDelegation

// IMPORTANT:
// If you don't specify a action for toolbar buttons,
// they will be disabled (grayed-out).
// So ALWAYS remember to set the IBAction for all buttons.

- (BOOL)validateToolbarItem:(NSToolbarItem *)item
{
    return YES;
}

- (NSArray *)toolbarSelectableItemIdentifiers: (NSToolbar *)toolbar
{
	return [self allIdentifiersFor:toolbar];
}

- (NSArray *)allIdentifiersFor:(NSToolbar *)toolbar
{
	NSMutableArray *identifiers = [[NSMutableArray alloc] init];
	
	for (NSToolbarItem *item in [toolbar items]) {
		[identifiers addObject:[item itemIdentifier]];
	}
	
	return [identifiers autorelease];
}
@end
