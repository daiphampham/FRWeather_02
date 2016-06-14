//
//  Weather.m
//  FRWeather_02
//
//  Created by framgia on 6/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(instancetype)init:(NSDictionary *)jsonData {
    self = [super init];
    if (self != nil) {
        
        Weather *weather = self;
        
        NSDictionary *dicWeather = [[jsonData objectForKey:@"weather"] objectAtIndex:0];
        weather.weatherId = [dicWeather objectForKey:@"id"];
        weather.weatherName = [dicWeather objectForKey:@"main"];
        weather.weatherDescription = [dicWeather objectForKey:@"description"];
        weather.weatherIcon = [dicWeather objectForKey:@"icon"];
        
        NSDictionary *dicMain = [jsonData objectForKey:@"main"];
        weather.temp = [dicMain objectForKey:@"temp"];
        weather.temp_min = [dicMain objectForKey:@"temp_min"];
        weather.temp_max = [dicMain objectForKey:@"temp_max"];
        weather.humidity = [dicMain objectForKey:@"humidity"];
        
        NSDictionary *dicWind = [jsonData objectForKey:@"wind"];
        weather.windSpeed = [dicWind objectForKey:@"speed"];
        weather.windDeg = [dicWind objectForKey:@"deg"];
        
        weather.nameCity = [jsonData objectForKey:@"name"];
        
    }
    
    return self;
}

@end
