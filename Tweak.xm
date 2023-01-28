#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import <substrate.h>
#include <sys/mman.h>
#import <mach-o/dyld.h>
#include <stdlib.h>
#include <time.h>
#import "UIKit/UIKit.h"

NSString *newDomain = @"https://example.com";

%hook NSURL
+(NSURL *) URLWithString:(NSString *)URLString
{
	if ([URLString hasPrefix:@"http"] && ![URLString hasPrefix:newDomain]) {
		NSLog(@"nsurlhook: URLWithString:%@", URLString);
		NSURL *urlObject = %orig(URLString);
		NSString *path = [urlObject path];
		NSString *newURLString = newDomain;
		if(path != nil){
			newURLString = [NSString stringWithFormat:@"%@%@", newURLString, path];
		}
		NSLog(@"nsurlhook: newUrl:%@", newURLString);
		return %orig(newURLString);
	}
	return %orig(URLString);
}
%end

%ctor
{
    @autoreleasepool
    {	
		NSLog(@"nsurlhook: loaded");
	}
}
