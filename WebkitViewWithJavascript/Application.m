//
//  Application.m
//  WebkitViewWithJavascript
//
//  Created by Nando Vieira on 8/8/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "Application.h"


@implementation Application
- (void)awakeFromNib
{
	// NOTE: When working with Javascript files, remember to drag them
	// to "Targets > YOUR-APP > Copy Bundle Resources", or they won't work
	// at all!
	
	// set window bottom border
	[window setContentBorderThickness:20.0f forEdge:NSMinYEdge];
	
	[view setDrawsBackground:NO];
    [view setUIDelegate:self];
    [view setFrameLoadDelegate:self];
	
	// define window.KEYNAME object; in this case, this object will
	// be accessible throught window.app
	[[view windowScriptObject] setValue:self forKey:@"app"];
	
	// retrieve path for app.html
	NSString* mainHtml = [[NSBundle mainBundle] pathForResource: @"app" 
														 ofType: @"html"];

	// define base url for assets files
	NSURL *baseUrl = [NSURL fileURLWithPath:[mainHtml stringByDeletingLastPathComponent]]; 
	
	// set the view to the content of app.html, providing the base url
	[[view mainFrame] loadHTMLString: [NSString stringWithContentsOfFile: mainHtml] 
							 baseURL: baseUrl];
	
	// set the script object
	script = [view windowScriptObject];
	
	// set the DOM object
	dom = [[view mainFrame] DOMDocument];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame 
{
	// after loading all files, we can safely interact with html/javascript
	[script evaluateWebScript:@"$('body').append('<p>Evaluated script from Cocoa!</p>');"];
	[script callWebScriptMethod:@"moreContent" withArguments:nil];
	
	// TODO: interact directly with the DOM structure
}

- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element 
    defaultMenuItems:(NSArray *)defaultMenuItems
{
	// disable right-click context menu
    return nil;
}

- (void)addContent:(id)content
{
	// this function must be explictly available to Javascript; check it out
	// the method +[Application isSelectorExcludedFromWebScript:(SEL)aSelector]
	// below for details
	
	NSString *format = @"$('body').append('<p>This content was added by Cocoa, but called from Javascript! <strong>%@</strong></p>');";
	NSString *string;
	
	// when an error occurs, the response class will be WebUndefined.
	// if you try to call a function from Javascript providing no arguments when
	// the Cocoa method expects some, we can catch the error.
	if ([content isKindOfClass:[WebUndefined class]]) {
		string = @"Using default text!";
	} else if ([content isKindOfClass:[NSString class]]) {
		string = content;
	} else {
		string = @"Using invalid argument type!";
	}
	
	// evaluate the script
	[script evaluateWebScript:[NSString stringWithFormat:format, string]];
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector
{
	// for all methods that you want to make available to Javascript, you need
	// to return NO
	if (aSelector == @selector(addContent:)) {
        return NO;
    }
    
	// return YES to deny access to
	// the remaining methods
    return YES;
}

- (void)dealloc
{
	[script release];
	[dom release];
	[super dealloc];
}
@end
