//
//  Application.h
//  WindowButtons
//
//  Created by Nando Vieira on 8/24/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Application : NSObject {
	IBOutlet NSMatrix *closeGroup;
	IBOutlet NSMatrix *minimizeGroup;
	IBOutlet NSMatrix *resizeGroup;
	IBOutlet NSWindow *win;
}

- (IBAction)applySettings:(id)sender;
- (void)setStatus:(NSMatrix *)group forButton:(int)button;
@end
