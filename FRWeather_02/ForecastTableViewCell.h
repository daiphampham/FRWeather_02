//
//  ForecastTableViewCell.h
//  FRWeather_02
//
//  Created by framgia on 6/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayForecast;
@property (weak, nonatomic) IBOutlet UIImageView *imageForecast;
@property (weak, nonatomic) IBOutlet UILabel *tempMax;
@property (weak, nonatomic) IBOutlet UILabel *tempMin;

@end
