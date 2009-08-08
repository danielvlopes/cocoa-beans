//
//  Application.h
//  WebkitViewWithJavascript
//
//  Created by Nando Vieira on 8/8/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface Application : NSObject {
	IBOutlet NSWindow *window;
	IBOutlet WebView *view;
	WebScriptObject *script;
	DOMDocument *dom;
}

- (void)addContent:(id)content;
@end
