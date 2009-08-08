//
//  FillController.m
//  ViewSwapping
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "FillController.h"


@implementation FillController
- (id)init
{
	// the nib name is exactly the nib file name but without the extension
	if (![super initWithNibName:@"Fill" bundle:nil]) {
		return nil;
	}
	
	[self setTitle:@"Fill"];
	return self;
}
@end
