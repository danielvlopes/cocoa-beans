//
//  Application.h
//  GrowlNotification
//
//  Created by Nando Vieira on 8/7/09.
//  Copyright 2009 Simples Ideias. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Growl/Growl.h>

// you need to implement 
// the GrowlApplicationBridgeDelegate protocol
@interface Application : NSObject <GrowlApplicationBridgeDelegate> {
	
}

-(NSDictionary *) registrationDictionaryForGrowl;
- (void)displayNotification;
@end
