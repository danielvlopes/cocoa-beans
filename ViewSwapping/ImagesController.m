//
//  ImagesController.m
//  ViewSwapping
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "ImagesController.h"


@implementation ImagesController
- (id)init
{
	// the nib name is exactly the nib file name but without the extension
	if (![super initWithNibName:@"Images" bundle:nil]) {
		return nil;
	}
	
	[self setTitle:@"Images"];
	return self;
}

@end
