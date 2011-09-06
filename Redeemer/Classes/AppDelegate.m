//
//  AppDelegate.m
//  Created by Max Bäumle.
//  http://github.com/iosdeveloper
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	
	redeemer = [[Redeemer alloc] initWithVoucher:[textField text]];
	[redeemer setDelegate:self];
	
	return NO;
}

- (void)redemptionFinished:(NSString *)responseString withSuccess:(BOOL)redeemed {
	[redeemer release];
	
	UIAlertView *alert = nil;
	
	if (redeemed) {
		if ([responseString isEqualToString:@"OK"]) {
			alert = [[UIAlertView alloc] initWithTitle:@"Voucher redeemed"
											   message:@"One-year subscription unlocked."
											  delegate:nil
									 cancelButtonTitle:@"OK"
									 otherButtonTitles:nil];
		} else if ([responseString length] == 6) {
			responseString = [responseString stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
			alert = [[UIAlertView alloc] initWithTitle:@"Voucher redeemed"
											   message:[NSString stringWithFormat:@"Issue %@ unlocked.", responseString]
											  delegate:nil
									 cancelButtonTitle:@"OK"
									 otherButtonTitles:nil];
		}
	} else {
		alert = [[UIAlertView alloc] initWithTitle:nil
										   message:@"Voucher invalid or already redeemed."
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
	}
	
	[alert show];
	[alert release];
}

- (void)redemptionFailed:(NSError *)error {
	[redeemer release];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
													message:[error localizedDescription]
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self.window makeKeyAndVisible];
	
	return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[window release];
	
	[super dealloc];
}

@end