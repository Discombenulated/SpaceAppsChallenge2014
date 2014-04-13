//
//  SkyScannerWS.h
//  Sky Snapper
//
//  Created by Ben Noble on 12/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PhotoDetails;

@interface SkySnapperWS : NSObject
-(NSString*) getUploadUrl;
-(NSString*) uploadImage:(UIImage*) image;
-(PhotoDetails*) getPhotoInformationForPhotoWithId:(NSString*) photoId;

+(long)getLongFromString:(NSString*)str;
@end
