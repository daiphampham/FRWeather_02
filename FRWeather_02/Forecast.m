//
//  Forecase.m
//  FRWeather_02
//
//  Created by framgia on 6/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "Forecast.h"

@implementation Forecast

-(instancetype)init:(NSDictionary *)jsonDataForecast {
    self = [super init];
    if (self != nil) {
        
        Forecast *forecast = self;
        
        self.weathers = [NSMutableArray new];
        
        NSArray *arrWeather = [jsonDataForecast objectForKey:@"list"];
        
        for (int i = 0; i < arrWeather.count; i++) {
            Weather *weather = [Weather new];
            
            NSDictionary *item = arrWeather[i];
            
            NSDictionary *dicWeather = [[item objectForKey:@"weather"]objectAtIndex:0];
            weather.weatherName = [dicWeather objectForKey:@"main"];
            weather.weatherDescription = [dicWeather objectForKey:@"description"];
            weather.weatherIcon = [dicWeather objectForKey:@"icon"];
            
            NSDictionary *dicMain = [item objectForKey:@"main"];
            weather.temp = [dicMain objectForKey:@"temp"];
            weather.temp_min = [dicMain objectForKey:@"temp_min"];
            weather.temp_max = [dicMain objectForKey:@"temp_max"];
            
            weather.time = [item objectForKey:@"dt_txt"];
            
            [forecast.weathers addObject:weather];
        }
    }
    
    return self;
}


@end
