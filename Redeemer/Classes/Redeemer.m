//
//  Redeemer.m
//  Created by Max Bäumle.
//  http://github.com/iosdeveloper
//

#import "Redeemer.h"
#import "ASIFormDataRequest.h"

@implementation Redeemer

@synthesize delegate;

- (id)initWithVoucher:(NSString *)code {
	self = [super init];
	
	if (self) {
		NSURL *url = [NSURL URLWithString:@"http://your.server.com/redeem.php"];
		
		ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
		[request setDelegate:self];
		[request setPostValue:code forKey:@"code"];
		[request startAsynchronous];
	}
	
	return self;
}

- (void)requestFinished:(ASIHTTPRequest *)request {
	NSString *responseString = [request responseString];
	
	if ([responseString length]) {
		if (self.delegate != nil && [self.delegate respondsToSelector:@selector(redemptionFinished:withSuccess:)]) {
			[self.delegate redemptionFinished:responseString withSuccess:YES];
		}
	} else {
		if (self.delegate != nil && [self.delegate respondsToSelector:@selector(redemptionFinished:withSuccess:)]) {
			[self.delegate redemptionFinished:nil withSuccess:NO];
		}
	}
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	if (self.delegate != nil && [self.delegate respondsToSelector:@selector(redemptionFinished:withSuccess:)]) {
		[self.delegate redemptionFailed:[request error]];
	}
}

@end