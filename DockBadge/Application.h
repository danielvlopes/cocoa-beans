//
//  Application.h
//  DockBadge
//
//  Created by Nando Vieira on 8/8/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Application : NSObject {
	NSDockTile *dock;	
	IBOutlet NSButton *button;
}

-(IBAction)toggleBadgeLabel:(id)sender;
- (void)bounceDockIcon:(NSTimer *)timer;
@end
