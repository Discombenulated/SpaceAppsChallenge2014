//
//  PhotoDetails.m
//  Sky Snapper
//
//  Created by Ben Noble on 13/04/2014.
//  Copyright (c) 2014 PA Consulting. All rights reserved.
//

#import "PhotoDetails.h"
#import "SkySnapperWS.h"

@implementation PhotoDetails

@synthesize photoId, position, compassDegrees, inclinationDegrees, timeTaken, averageColor, paletteColor;

-(id) initWithDictionary:(NSDictionary*) properties {
    self = [super init];
    self.photoId = [properties objectForKey:@"id"];
    self.compassDegrees = [SkySnapperWS getLongFromString:[properties objectForKey:@"compassDegrees"]];
    self.inclinationDegrees = [SkySnapperWS getLongFromString:[properties objectForKey:@"inclinationDegrees"]];
    self.timeTaken = [NSDate dateWithTimeIntervalSince1970:[SkySnapperWS getLongFromString:[properties objectForKey:@"takenTimestamp"]]];
    long lat = [SkySnapperWS getLongFromString:[properties objectForKey:@"lat"]];
    long lon = [SkySnapperWS getLongFromString:[properties objectForKey:@"lon"]];
    self.position = CGPointMake(lat, lon);
    long averageR = [SkySnapperWS getLongFromString:[properties objectForKey:@"averageR"]];
    long averageG = [SkySnapperWS getLongFromString:[properties objectForKey:@"averageG"]];
    long averageB = [SkySnapperWS getLongFromString:[properties objectForKey:@"averageB"]];
    self.averageColor = [UIColor colorWithRed:averageR/255.0 green:averageG/255.0 blue:averageB/255.0 alpha:1.0];
    long paletteR = [SkySnapperWS getLongFromString:[properties objectForKey:@"paletteR"]];
    long paletteB = [SkySnapperWS getLongFromString:[properties objectForKey:@"paletteG"]];
    long paletteG = [SkySnapperWS getLongFromString:[properties objectForKey:@"paletteB"]];
    self.paletteColor = [UIColor colorWithRed:paletteR/255.0 green:paletteG/255.0 blue:paletteB/255.0 alpha:1.0];
    return self;
}

@end
