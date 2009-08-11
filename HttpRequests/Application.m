#import "Application.h"

@implementation Application
@synthesize textField;
@synthesize loader;

- (IBAction)doAsyncRequest:(id)sender
{
	NSURL *url = [NSURL URLWithString:@"http://f.simplesideias.com.br/cocoa-beans/sleep.php"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	RequestDelegation *handler = [[RequestDelegation alloc] init];
	[handler setContext:self];
	[loader startAnimation:nil];
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:handler];
	[connection release];
}

- (IBAction)doSyncRequest:(id)sender
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

- (IBAction)doNSStringRequest:(id)sender
{
	NSURL *url = [NSURL URLWithString:@"http://f.simplesideias.com.br/cocoa-beans/sleep.php"];
	
	[loader startAnimation:nil];
	NSString *content = [NSString stringWithContentsOfURL:url];
	[loader stopAnimation:nil];
	[textField setStringValue:content];
}
@end
