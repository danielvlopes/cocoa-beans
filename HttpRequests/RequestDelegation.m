//
//  RequestDelegation.m
//  HttpRequests
//
//  Created by Nando Vieira on 8/10/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import "RequestDelegation.h"


@implementation RequestDelegation
@synthesize context;

- (id)init
{
	[super init];
	
	responseData = [[NSMutableData alloc] init];
	
	return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)theResponse
{
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *content = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[[context textField] setStringValue:content];
	[[context loader] stopAnimation:nil];
}
@end
