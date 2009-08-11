#import <Cocoa/Cocoa.h>
#import "RequestDelegation.h"

@interface Application : NSObject {
	IBOutlet NSTextField *textField;
	IBOutlet NSProgressIndicator *loader;
}
- (IBAction)doAsyncRequest:(id)sender;
- (IBAction)doSyncRequest:(id)sender;
- (IBAction)doNSStringRequest:(id)sender;

@property (nonatomic, readonly) NSTextField *textField;
@property (nonatomic, readonly) NSProgressIndicator *loader;
@end
