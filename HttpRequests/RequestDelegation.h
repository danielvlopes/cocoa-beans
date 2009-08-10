//
//  RequestDelegation.h
//  HttpRequests
//
//  Created by Nando Vieira on 8/10/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RequestDelegation : NSObject {
	NSObject *context;
	NSMutableData *responseData;
}

@property (nonatomic, retain) NSObject *context;
@end
