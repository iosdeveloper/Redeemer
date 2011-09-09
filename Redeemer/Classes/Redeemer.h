//
//  Redeemer.h
//  Created by Max Bäumle.
//  http://github.com/iosdeveloper
//

#import <Foundation/Foundation.h>

@protocol RedeemerDelegate <NSObject>

@optional

- (void)redemptionFinished:(NSString *)responseString;
- (void)redemptionFailed:(NSError *)error;

@end

@interface Redeemer : NSObject {
	id <RedeemerDelegate> _delegate;
}

@property (nonatomic, assign) id <RedeemerDelegate> delegate;

- (id)initWithVoucher:(NSString *)code;

@end