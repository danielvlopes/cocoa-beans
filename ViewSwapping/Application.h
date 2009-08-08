//
//  Application.h
//  ViewSwapping
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ToolbarDelegation.h"
#import "FillController.h"
#import "ImagesController.h"
#import "NotesController.h"

@interface Application : NSObject {
	IBOutlet NSBox *viewHolder;
	IBOutlet NSToolbar *toolbar;
	IBOutlet NSWindow *window;
	
	ToolbarDelegation *toolbarHandler;
	NSMutableArray *availableControllers;
}

- (IBAction)changeView:(id)sender;
@end
