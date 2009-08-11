#import <Cocoa/Cocoa.h>
#import "RequestDelegation.h"

@interface Application : NSObject {
	IBOutlet NSTextField *textField;
	IBOutlet NSProgressIndicator *loader;
	IBOutlet NSPopUpButton *options;
}
- (void)doAsyncRequest;
- (void)doSyncRequest;
- (void)doNSStringRequest;
- (void)doThreadedRequest;

- (IBAction)changedRequestMode:(id)sender;

@property (nonatomic, readonly) NSTextField *textField;
@property (nonatomic, readonly) NSProgressIndicator *loader;
@end
