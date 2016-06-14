//
//  APIWeather.m
//  FRWeather_02
//
//  Created by framgia on 6/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "APIWeather.h"

@implementation APIWeather

-(instancetype)init {
    self = [super init];
    if (self != nil) {
        self.networkService = [NetworkService new];
    }
    
    return self;
}

-(void) getDataWeather: (NSString *)url complete:(void(^)(Weather *weather))completeBlock{
    
    
    [self.networkService getData: url
                       parameter: nil
                        complete: ^(NSDictionary *data, NSError *error) {
                            
                            Weather *weather = [[Weather alloc]init:data];
                            completeBlock(weather);
                        }];
}

-(void) getDataForecast: (NSString *)url complete: (void(^)(Forecast *forecast))completeBlock {
    [self.networkService getData:url
                       parameter:nil
                        complete:^(NSDictionary *data, NSError *error) {
                            
                            Forecast *forecast = [[Forecast alloc]init:data];
                            completeBlock(forecast);
                        }];
}

@end
