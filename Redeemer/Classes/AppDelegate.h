//
//  AppDelegate.h
//  Created by Max Bäumle.
//  http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>
#import "Redeemer.h"

@interface AppDelegate : NSObject <UIApplicationDelegate, RedeemerDelegate> {
	UIWindow *window;
	Redeemer *redeemer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end