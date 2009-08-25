//
//  Application.m
//  WindowButtons
//
//  Created by Nando Vieira on 8/24/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"


@implementation Application
- (IBAction)applySettings:(id)sender {
	[self setStatus:resizeGroup forButton:NSWindowZoomButton];
	[self setStatus:closeGroup forButton:NSWindowCloseButton];
	[self setStatus:minimizeGroup forButton:NSWindowMiniaturizeButton];
}

- (void)setStatus:(NSMatrix *)group forButton:(int)button {
	int index = [group selectedColumn];
	
	if (index == 0) {
		// hidden
		[[win standardWindowButton:button] setHidden:YES];
	} else if (index == 1) {
		// disabled
		[[win standardWindowButton:button] setHidden:NO];
		[[win standardWindowButton:button] setEnabled:FALSE];
	} else {
		// visible and enabled
		[[win standardWindowButton:button] setHidden:NO];
		[[win standardWindowButton:button] setEnabled:YES];
	}
}
@end
