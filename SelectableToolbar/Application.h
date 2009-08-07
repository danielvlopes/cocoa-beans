//
//  Application.h
//  SelectableToolbar
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Application : NSObject {
	IBOutlet NSToolbar *toolbar;
}
- (IBAction)buttonClicked: (id)sender;
@end
