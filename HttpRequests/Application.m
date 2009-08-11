#import "Application.h"

@implementation Application
@synthesize textField;
@synthesize loader;

- (void)awakeFromNib
{
	[options addItemWithTitle:@""];
	[options addItemWithTitle:@"Synchronous"];
	[options addItemWithTitle:@"Asynchronous"];
	[options addItemWithTitle:@"Synchronous with NSString"];
	[options addItemWithTitle:@"Threaded with NSString"];
}

- (void)doAsyncRequest
{
	NSURL *url = [NSURL URLWithString:@"http://f.simplesideias.com.br/cocoa-beans/sleep.php"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	RequestDelegation *handler = [[RequestDelegation alloc] init];
	[handler setContext:self];
	[loader startAnimation:nil];
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:handler];
	[connection release];
}

- (void)doSyncRequest
{
	NSURL *url = [NSURL URLWithString:@"http://f.simplesideias.com.br/cocoa-beans/sleep.php"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	NSError *error;
	NSHTTPURLResponse *response;
	
	[loader startAnimation:nil];
	
	NSMutableData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	[loader stopAnimation:nil];
	NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	[textField setStringValue:content];
	NSLog(@"error: %@", error);
	NSLog(@"response: %@", [response allHeaderFields]);
}

- (void)doNSStringRequest
{
	NSURL *url = [NSURL URLWithString:@"http://f.simplesideias.com.br/cocoa-beans/sleep.php"];
	
	[loader startAnimation:nil];
	NSString *content = [NSString stringWithContentsOfURL:url];
	[loader stopAnimation:nil];
	[textField setStringValue:content];
}

- (void)doThreadedRequest
{
	[NSThread detachNewThreadSelector:@selector(runThread:) toTarget:self withObject:nil];
}

- (void)runThread:(id)anObject
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[self doNSStringRequest];
	
	[pool release];
}

- (IBAction)changedRequestMode:(id)sender
{
	switch ([sender indexOfSelectedItem]) {
		case 1:
			[self doSyncRequest];
			break;
		case 2:
			[self doAsyncRequest];
			break;
		case 3:
			[self doNSStringRequest];
			break;
		case 4:
			[self doThreadedRequest];
			break;
	}
}
@end
