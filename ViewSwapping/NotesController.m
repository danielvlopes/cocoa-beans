//
//  NotesController.m
//  ViewSwapping
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "NotesController.h"


@implementation NotesController
- (id)init
{
	// the nib name is exactly the nib file name but without the extension
	if (![super initWithNibName:@"Notes" bundle:nil]) {
		return nil;
	}
	
	[self setTitle:@"Notes"];
	return self;
}
@end
