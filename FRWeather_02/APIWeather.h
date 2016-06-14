//
//  APIWeather.h
//  FRWeather_02
//
//  Created by framgia on 6/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkService.h"
#import "Forecast.h"
#import "Weather.h"

@interface APIWeather : NSObject

@property (strong, nonatomic) NetworkService *networkService;

-(void) getDataWeather: (NSString *)url complete:(void(^)(Weather *weather))completeBlock;
-(void) getDataForecast: (NSString *)url complete: (void(^)(Forecast *forecast))completeBlock;

@end