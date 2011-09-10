//
//  RedeemerCompanionAppDelegate.h
//  Created by Max Bäumle.
//  http://github.com/iosdeveloper
//

#import <Cocoa/Cocoa.h>

@interface RedeemerCompanionAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	NSTextField *numberOfCodes;
	NSProgressIndicator *activityIndicator;
	NSButton *addToMySQL;
	NSTextView *result;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *numberOfCodes;
@property (assign) IBOutlet NSProgressIndicator *activityIndicator;
@property (assign) IBOutlet NSButton *addToMySQL;
@property (assign) IBOutlet NSTextView *result;

- (IBAction)requestCodes:(id)sender;

@end