//
//  RedeemerCompanionAppDelegate.m
//  Created by Max Bäumle.
//  http://github.com/iosdeveloper
//

#import "RedeemerCompanionAppDelegate.h"

@implementation RedeemerCompanionAppDelegate

@synthesize window, numberOfCodes, activityIndicator, addToMySQL, result;

- (IBAction)requestCodes:(id)sender {
	[activityIndicator startAnimation:self];
	
	NSString *URLString = [NSString stringWithFormat:@"http://www.random.org/strings/?num=%@&len=12&digits=on&upperalpha=on&loweralpha=off&unique=on&format=plain", numberOfCodes.stringValue];
	NSString *resultString = [NSString stringWithContentsOfURL:[NSURL URLWithString:URLString] encoding:NSUTF8StringEncoding error:NULL];
	
	[result setString:resultString];
	
	if (addToMySQL.state) {
		NSArray *requestedCodes = [resultString componentsSeparatedByString:@"\n"];
		for (int i = 0; i < requestedCodes.count; i ++) {
			NSString *requestedCode = [requestedCodes objectAtIndex:i];
			
			if (requestedCode.length == 12) {
				URLString = [NSString stringWithFormat:@"http://your.server.com/request.php?code=%@&issue=0", requestedCode];
				[NSString stringWithContentsOfURL:[NSURL URLWithString:URLString] encoding:NSUTF8StringEncoding error:NULL];
			}
		}
	}
	
	[activityIndicator stopAnimation:self];
}

@end