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
	if (self.delegate != nil && [self.delegate respondsToSelector:@selector(redemptionFinished:)]) {
		[self.delegate redemptionFinished:request.responseString];
	}
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	if (self.delegate != nil && [self.delegate respondsToSelector:@selector(redemptionFailed:)]) {
		[self.delegate redemptionFailed:request.error];
	}
}

@end