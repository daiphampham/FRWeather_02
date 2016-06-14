//
//  HomeViewController.m
//  FRWeather_02
//
//  Created by framgia on 6/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData {
    
    self.apiWeather = [APIWeather new];
    
    [self.apiWeather getDataWeather:URL_API_WEATHER complete:^(Weather *weather) {
        NSString *weatherName = weather.weatherName;
        NSString *cityName = weather.nameCity;
        NSString *temp = weather.temp_min;
        
        self.city.text = cityName;
        self.weatherDescription.text = weatherName;
        self.weatherTmp.text = [NSString stringWithFormat:@"%@ °",temp];
    }];
    
    
    [self.apiWeather getDataForecast:URL_API_FORECAST complete:^(Forecast *forecast) {
        self.weathers = forecast.weathers;
        [self.tableViewForecast reloadData];
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weathers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForecastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Weather *weatherItem = [self.weathers objectAtIndex:indexPath.row];
    cell.dayForecast.text = weatherItem.time;
    cell.imageForecast.image = [UIImage imageNamed:weatherItem.weatherIcon];
    cell.tempMax.text = weatherItem.temp_max;
    cell.tempMin.text = weatherItem.temp_min;
    
    return  cell;
}

@end
