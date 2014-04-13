//
//  PhotoDetails.h
//  Sky Snapper
//
//  Created by Ben Noble on 13/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoDetails : NSObject

@property (nonatomic, strong) NSString* photoId;
@property (nonatomic) CGPoint position;
@property (nonatomic, strong) UIColor* paletteColor;
@property (nonatomic, strong) UIColor* averageColor;
@property (nonatomic) long compassDegrees;
@property (nonatomic) long inclinationDegrees;
@property (nonatomic) NSDate* timeTaken;

-(id) initWithDictionary:(NSDictionary*) properties;

@end
