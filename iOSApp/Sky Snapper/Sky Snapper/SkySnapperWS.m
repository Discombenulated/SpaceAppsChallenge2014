//
//  SkyScannerWS.m
//  Sky Snapper
//
//  Created by Ben Noble on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "SkySnapperWS.h"

@implementation SkySnapperWS

NSString* serviceUrl = @"http://www.skysnapper.net/restapi";

-(NSString*) getJsonDataForRequest{
    return @"";
}

-(NSString*) getUploadUrl {
    NSString* urlStr = [NSString stringWithFormat:@"%@", serviceUrl];
    //NSURL* url = []
    return @"";
}

@end
