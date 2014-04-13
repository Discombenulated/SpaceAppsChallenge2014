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

-(NSDictionary*) getJsonDataForRequest:(NSURLRequest*) request {
    NSError* error = nil;
    NSURLResponse* response = [NSURLResponse new];
    NSData* data = nil;
    
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@"Error with connection: %@", error);
    }
    
    NSLog(@"Response: %@", response);
    
    NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    if (error) {
        NSLog(@"Error with JSON: %@", error);
        NSLog(@"Data: %@", data);
        NSString* newStr = [NSString stringWithUTF8String:[data bytes]];
        NSLog(@"Data string: %@", newStr);
    }
    
    return jsonDict;
}

-(NSString*) getUploadUrl {
    NSString* urlStr = [NSString stringWithFormat:@"%@", serviceUrl];
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    NSDictionary* result = [self getJsonDataForRequest:request];
    NSDictionary* photoUpload = [result objectForKey:@"photoUpload"];
    NSString* uploadUrl = [photoUpload objectForKey:@"uploadURL"];
    if (uploadUrl == nil || [uploadUrl length] <= 0) {
        for (NSString* key in photoUpload.allKeys){
            NSLog(@"Key: %@", key);
        }
    }
    return uploadUrl;
}

-(void) uploadImage:(UIImage*) image {
    NSString* uploadImageUrl = [self getUploadUrl];
    NSLog(@"Upload url: %@", uploadImageUrl);
    
    NSURL* url = [NSURL URLWithString:uploadImageUrl];
    
    [NSThread sleepForTimeInterval:1.0f];
    
    // Resize image
    UIImage *tempImage = nil;
    CGSize targetSize = CGSizeMake(image.size.width / 2, image.size.height / 2);
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectMake(0, 0, 0, 0);
    thumbnailRect.origin = CGPointMake(0.0,0.0);
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    [image drawInRect:thumbnailRect];
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData* imageData = UIImageJPEGRepresentation(tempImage, 0.5);

    // Add the request parameters
    NSMutableDictionary* requestParams = [NSMutableDictionary new];
    [requestParams setValue:@"Sky Scanner Image" forKey:@"title"];
    
    NSError* error = nil;
    NSData* requestParamsData = [NSJSONSerialization dataWithJSONObject:requestParams options:0 error:&error];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"-----------------BOUNDARY123456765432348765";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"message\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:requestParamsData];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"fileName\"; filename=\".jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    // now lets make the connection to the web
    NSDictionary* result = [self getJsonDataForRequest:request];
    NSLog(@"Upload result: %@", result);
}

@end
